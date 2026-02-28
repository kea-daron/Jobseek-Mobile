import 'package:flutter/material.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_login.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_register_with_email.dart';
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
  @override
  Widget build(BuildContext context) {
    final List<String> createIcons = [
      "assets/icons/mobile-phone.png",
      "assets/icons/linkin.png",
      "assets/icons/google-icon.png",
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              LogoAuth(
                title: "Join as a JobSeeker",
                subtitle: "Create your account to get started",
              ),
              const SizedBox(height: 40),
              InputName(),
              const SizedBox(height: 10),
              InputPhoneNumber(),
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
              InputPassword(),
              const SizedBox(height: 10),
              ConfirmPassword(),
              const SizedBox(height: 40),
              ShareButton(label: "Register", link: JobSeekerLogin()),
              const SizedBox(height: 50),
              OtherMethod(title: "Already have an account", icons: createIcons),
            ],
          ),
        ),
      ),
    );
  }
}
