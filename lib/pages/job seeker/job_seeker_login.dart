import 'package:flutter/material.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_home_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_register_with_email.dart';
import 'package:jobseek/shared/auth/auth_api_service.dart';
import 'package:jobseek/shared/auth/auth_inputs.dart';
import 'package:jobseek/shared/auth/button.dart';
import 'package:jobseek/shared/auth/forgot_password_page.dart';
import 'package:jobseek/shared/auth/logo_auth.dart';
import 'package:jobseek/shared/auth/other_method.dart';
import 'package:jobseek/shared/themes.dart';

class JobSeekerLogin extends StatefulWidget {
  const JobSeekerLogin({super.key});

  @override
  State<JobSeekerLogin> createState() => _JobSeekerLoginState();
}

class _JobSeekerLoginState extends State<JobSeekerLogin> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authApiService = const AuthApiService();

  bool _isLoading = false;

  final List<String> loginIcons = [
    "assets/icons/email.png",
    "assets/icons/linkin.png",
    "assets/icons/google-icon.png",
  ];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await _authApiService.login(
        LoginRequest(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        ),
      );

      if (!mounted) {
        return;
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          settings: const RouteSettings(name: '/job-seeker-home'),
          builder: (_) => JobSeekerHomePage(),
        ),
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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),
                LogoAuth(
                  title: "Welcome Back",
                  subtitle: "Please enter your details to sign in.",
                ),
                const SizedBox(height: 40),
                InputEmail(controller: _emailController),
                const SizedBox(height: 10),
                InputPassword(controller: _passwordController),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ForgotPasswordPage(
                          loginPage: const JobSeekerLogin(),
                        ),
                      ),
                    ),
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(fontSize: AppFonts.body),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                _isLoading
                    ? const CircularProgressIndicator()
                    : ShareButton(
                        label: "Login",
                        link: JobSeekerHomePage(),
                        routeName: '/job-seeker-home',
                        onPressed: _login,
                      ),
                const SizedBox(height: 30),
                OtherMethod(title: "Other login method", icons: loginIcons),
                const SizedBox(height: 100),
                Text("Don't have an account yet?"),
                GestureDetector(
                  onTap: () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobSeekerRegisterWithEmail(),
                      ),
                    ),
                  },
                  child: Text(
                    "Create new account",
                    style: TextStyle(
                      color: AppColors.primary,
                      decorationColor: Colors.black,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
