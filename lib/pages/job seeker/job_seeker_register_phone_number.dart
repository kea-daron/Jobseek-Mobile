import 'package:flutter/material.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_login.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_register_with_email.dart';
import 'package:jobseek/shared/auth/auth_api_service.dart';
import 'package:jobseek/shared/auth/auth_inputs.dart';
import 'package:jobseek/shared/auth/button.dart';
import 'package:jobseek/shared/auth/logo_auth.dart';
import 'package:jobseek/shared/auth/other_method.dart';
import 'package:jobseek/shared/themes.dart';

class JobSeekerRegisterWithPhoneNumber extends StatefulWidget {
  const JobSeekerRegisterWithPhoneNumber({super.key});

  @override
  State<JobSeekerRegisterWithPhoneNumber> createState() =>
      _JobSeekerRegisterWithPhoneNumberState();
}

class _JobSeekerRegisterWithPhoneNumberState
    extends State<JobSeekerRegisterWithPhoneNumber> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authApiService = const AuthApiService();

  bool _isLoading = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
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
          role: 'USER',
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
        MaterialPageRoute(builder: (_) => JobSeekerLogin()),
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
    final List<String> createIcons = [
      "assets/icons/mobile-phone.png",
      "assets/icons/linkin.png",
      "assets/icons/google-icon.png",
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  LogoAuth(
                    title: "Join as a JobSeeker",
                    subtitle: "Create your account to get started",
                  ),
                  const SizedBox(height: 40),
                  InputName(controller: _fullNameController),
                  const SizedBox(height: 10),
                  InputEmail(controller: _emailController),
                  const SizedBox(height: 10),
                  InputPhoneNumber(controller: _phoneNumberController),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => JobSeekerRegisterWithEmail(),
                          ),
                        );
                      },
                      child: Text(
                        "Use email address instead",
                        style: TextStyle(
                          color: AppColors.primary,
                          decorationColor: Colors.black,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  InputPassword(controller: _passwordController),
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 40),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : ShareButton(
                          label: "Register",
                          link: const JobSeekerLogin(),
                          onPressed: _register,
                        ),
                  const SizedBox(height: 50),
                  OtherMethod(
                    title: "Already have an account",
                    icons: createIcons,
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
