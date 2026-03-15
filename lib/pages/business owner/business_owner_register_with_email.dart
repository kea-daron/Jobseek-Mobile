import 'package:flutter/material.dart';
import 'package:jobseek/pages/business%20owner/business_owner_login.dart';
import 'package:jobseek/pages/business%20owner/business_owner_register_with_phone_number.dart';
import 'package:jobseek/shared/auth/auth_api_service.dart';
import 'package:jobseek/shared/auth/auth_inputs.dart';
import 'package:jobseek/shared/auth/button.dart';
import 'package:jobseek/shared/auth/logo_auth.dart';
import 'package:jobseek/shared/themes.dart';

class BusinessOwnerRegisterWithEmail extends StatefulWidget {
  const BusinessOwnerRegisterWithEmail({super.key});

  @override
  State<BusinessOwnerRegisterWithEmail> createState() =>
      _BusinessOwnerRegisterWithEmailState();
}

class _BusinessOwnerRegisterWithEmailState
    extends State<BusinessOwnerRegisterWithEmail> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _roleController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authApiService = const AuthApiService();

  bool _isLoading = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _roleController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await _authApiService.register(
        RegisterRequest(
          fullName: _fullNameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text,
          phoneNumber: _phoneNumberController.text.trim(),
          role: _roleController.text.trim(),
        ),
      );

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration successful. Please login.')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => BusinessOwnerLogin()),
      );
    } catch (error) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString().replaceFirst('Exception: ', '')),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  LogoAuth(
                    title: "Join as a Business Owner",
                    subtitle: "Create your account to get started",
                  ),
                  SizedBox(height: 40),
                  InputName(controller: _fullNameController),
                  SizedBox(height: 15),
                  InputEmail(controller: _emailController),
                  SizedBox(height: 15),
                  InputPhoneNumber(controller: _phoneNumberController),
                  SizedBox(height: 15),
                  InputRole(controller: _roleController),
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                BusinessOwnerRegisterWithPhoneNumber(),
                          ),
                        );
                      },
                      child: Text(
                        "Use phone number instead",
                        style: TextStyle(
                          color: AppColors.primary,
                          decorationColor: Colors.black,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  InputPassword(controller: _passwordController),
                  SizedBox(height: 15),
                  ConfirmPassword(
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please confirm password";
                      }
                      if (value != _passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : ShareButton(
                          label: "Register",
                          link: BusinessOwnerLogin(),
                          onPressed: _register,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
