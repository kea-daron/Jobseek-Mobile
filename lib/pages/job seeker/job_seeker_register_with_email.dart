import 'package:flutter/material.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_login.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_register_phone_number.dart';
import 'package:jobseek/shared/auth/auth_inputs.dart';
import 'package:jobseek/shared/auth/button.dart';
import 'package:jobseek/shared/auth/logo_auth.dart';
import 'package:jobseek/shared/auth/other_method.dart';
import 'package:jobseek/shared/themes.dart';

class JobSeekerRegisterWithEmail extends StatefulWidget {
  const JobSeekerRegisterWithEmail({super.key});

  @override
  State<JobSeekerRegisterWithEmail> createState() => _CreaetAccountState();
}

class _CreaetAccountState extends State<JobSeekerRegisterWithEmail> {
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
              const SizedBox(height: 15),
              InputEmail(),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => JobSeekerRegisterWithPhoneNumber(),
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
              const SizedBox(height: 15),
              InputPassword(),
              const SizedBox(height: 15),
              ConfirmPassword(),
              const SizedBox(height: 60),
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
