import 'package:flutter/material.dart';
import 'package:jobseek/pages/business%20owner/business_owner_register_with_phone_number.dart';
import 'package:jobseek/pages/business%20owner/business_owner_home_page.dart';
import 'package:jobseek/shared/auth/auth_inputs.dart';
import 'package:jobseek/shared/auth/button.dart';
import 'package:jobseek/shared/auth/forgot_password_page.dart';
import 'package:jobseek/shared/auth/logo_auth.dart';
import 'package:jobseek/shared/auth/other_method.dart';
import 'package:jobseek/shared/themes.dart';

class BusinessOwnerLogin extends StatelessWidget {
  BusinessOwnerLogin({super.key});
  final List<String> loginIcons = [
    "assets/icons/email.png",
    "assets/icons/linkin.png",
    "assets/icons/google-icon.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              LogoAuth(
                title: "Welcome Back",
                subtitle: "Please enter your details to sign in.",
              ),
              const SizedBox(height: 40),
              InputPhoneNumber(),
              const SizedBox(height: 10),
              InputPassword(),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ForgotPasswordPage(loginPage: BusinessOwnerLogin()),
                    ),
                  ),
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(fontSize: AppFonts.body),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ShareButton(label: "Login", link: BusinessOwnerHomePage()),
              const SizedBox(height: 30),
              OtherMethod(title: "Other login method", icons: loginIcons),
              const SizedBox(height: 100),
              Text("Don't have an account yet?"),
              GestureDetector(
                onTap: () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BusinessOwnerRegisterWithPhoneNumber(),
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
    );
  }
}
