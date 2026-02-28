import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobseek/shared/themes.dart';

class ForgotPasswordPage extends StatefulWidget {
  /// The login page to go back to (JobSeekerLogin / BusinessOwnerLogin).
  final Widget loginPage;

  const ForgotPasswordPage({super.key, required this.loginPage});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool _useEmail = false;

  final List<String> _icons = const [
    "assets/icons/mobile-phone.png",
    "assets/icons/linkin.png",
    "assets/icons/google-icon.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),

              // ── Logo ────────────────────────────────────────────────────
              Image.asset(
                'assets/images/logo.png',
                height: 140,
                width: 140,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),

              // ── Title ───────────────────────────────────────────────────
              Text(
                'Forget Password',
                style: TextStyle(
                  fontSize: AppFonts.subtitle,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _useEmail
                    ? 'To reset password, enter the email address you use\nto sign in below.'
                    : 'To reset password, enter the phone number you use\nto sign in below.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 40),

              // ── Input ───────────────────────────────────────────────────
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: _useEmail
                    ? _EmailInput(key: const ValueKey('email'))
                    : _PhoneInput(key: const ValueKey('phone')),
              ),
              const SizedBox(height: 10),

              // ── Toggle link ──────────────────────────────────────────────
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => setState(() => _useEmail = !_useEmail),
                  child: Text(
                    _useEmail
                        ? 'Use phone number instead'
                        : 'Use email address instead',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primary,
                      decorationThickness: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // ── Submit button ────────────────────────────────────────────
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // TODO: implement password-reset logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Reset link sent! Please check your inbox.',
                        ),
                        backgroundColor: Color(0xFF0A2572),
                      ),
                    );
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // ── Back to login ────────────────────────────────────────────
              Row(
                children: const [
                  Expanded(child: Divider(thickness: 2, color: Colors.grey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Back to login',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                  Expanded(child: Divider(thickness: 2, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _icons.map((iconPath) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => widget.loginPage),
                      ),
                      child: Image.asset(iconPath, height: 30, width: 30),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Phone input with +855 prefix ────────────────────────────────────────────
class _PhoneInput extends StatelessWidget {
  const _PhoneInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE3E3E3),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              '+855',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          Container(width: 1, height: 24, color: Colors.black26),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                hintText: 'Phone Number',
                hintStyle: TextStyle(color: Colors.black45),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Email input ──────────────────────────────────────────────────────────────
class _EmailInput extends StatelessWidget {
  const _EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE3E3E3),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: 'Email Address',
          hintStyle: TextStyle(color: Colors.black45),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}
