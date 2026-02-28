import 'package:flutter/material.dart';
import 'package:jobseek/pages/business%20owner/business_owner_login.dart';
import 'package:jobseek/pages/business%20owner/business_owner_register_with_email.dart';
import 'package:jobseek/shared/auth/auth_inputs.dart';
import 'package:jobseek/shared/auth/button.dart';
import 'package:jobseek/shared/auth/logo_auth.dart';
import 'package:jobseek/shared/themes.dart';

class BusinessOwnerRegisterWithPhoneNumber extends StatelessWidget {
  const BusinessOwnerRegisterWithPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              LogoAuth(
                title: "Join as a Business Owner",
                subtitle: "Create your account to get started",
              ),
              SizedBox(height: 40),
              InputName(),
              SizedBox(height: 15),
              InputPhoneNumber(),
              SizedBox(height: 15),
              InputCompanyName(),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BusinessOwnerRegisterWithEmail(),
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
              SizedBox(height: 15),
              InputPassword(),
              SizedBox(height: 15),
              ConfirmPassword(),
              SizedBox(height: 40),
              ShareButton(label: "Register", link: BusinessOwnerLogin()),
            ],
          ),
        ),
      ),
    );
  }
}
