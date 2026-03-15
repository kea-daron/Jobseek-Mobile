import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jobseek/shared/auth/auth_storage.dart';

class RegisterRequest {
  final String fullName;
  final String email;
  final String password;
  final String phoneNumber;
  final String role;

  const RegisterRequest({
    required this.fullName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'role': role,
    };
  }
}

class LoginRequest {
  final String email;
  final String password;

  const LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}

class LoginResult {
  final String role;

  const LoginResult({required this.role});
}

class AuthApiService {
  const AuthApiService();

  String get _baseUrl {
    // Android emulator cannot reach host machine via localhost.
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      return 'http://10.0.2.2:8080';
    }
    return 'http://localhost:8080';
  }

  Future<void> register(RegisterRequest request) async {
    final uri = Uri.parse('$_baseUrl/api/v1/auth/register');

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return;
    }

    throw Exception(
      _extractErrorMessage(
        response.body,
        'Registration failed. Please try again.',
      ),
    );
  }

  Future<LoginResult> login(LoginRequest request) async {
    final uri = Uri.parse('$_baseUrl/api/v1/auth/login');

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        final dynamic decoded = jsonDecode(response.body);
        if (decoded is Map<String, dynamic>) {
          if (decoded['refreshToken'] is String) {
            await AuthStorage.saveRefreshToken(
              decoded['refreshToken'] as String,
            );
          }

          final String? role = _extractRole(decoded);
          if (role == null || role.isEmpty) {
            throw Exception(
              'Login succeeded but user role was not returned by API.',
            );
          }

          return LoginResult(role: role.toUpperCase());
        }
      } on Exception {
        rethrow;
      } catch (_) {}

      throw Exception('Login succeeded but response format is invalid.');
    }

    throw Exception(
      _extractErrorMessage(
        response.body,
        'Login failed. Please check your credentials.',
      ),
    );
  }

  Future<void> logout() async {
    final refreshToken = await AuthStorage.getRefreshToken();

    final uri = Uri.parse('$_baseUrl/api/v1/auth/logout');

    await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'refreshToken': refreshToken ?? ''}),
    );

    // Always clear local storage regardless of server response.
    await AuthStorage.clear();
  }

  String _extractErrorMessage(String responseBody, String fallbackMessage) {
    String message = fallbackMessage;
    try {
      final dynamic decoded = jsonDecode(responseBody);
      if (decoded is Map<String, dynamic> && decoded['message'] is String) {
        message = decoded['message'] as String;
      }
    } catch (_) {
      // Keep default fallback message if the response body is not JSON.
    }

    return message;
  }

  String? _extractRole(Map<String, dynamic> data) {
    if (data['role'] is String) {
      return data['role'] as String;
    }

    final dynamic user = data['user'];
    if (user is Map<String, dynamic> && user['role'] is String) {
      return user['role'] as String;
    }

    final dynamic payload = data['data'];
    if (payload is Map<String, dynamic> && payload['role'] is String) {
      return payload['role'] as String;
    }

    return null;
  }
}
