import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final Color inputFormBgColor = const Color(0xFFE3E3E3);

// Input phonenumber
class InputPhoneNumber extends StatelessWidget {
  final TextEditingController? controller;
  const InputPhoneNumber({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        fillColor: inputFormBgColor,
        filled: true,
        border: InputBorder.none,
        hintText: "Phone Number",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Phone number is required";
        }
        return null;
      },
    );
  }
}

// Input name
class InputName extends StatelessWidget {
  final TextEditingController? controller;
  const InputName({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "Full name",
        fillColor: inputFormBgColor,
        filled: true,
        border: InputBorder.none,
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Full name is required";
        }
        return null;
      },
    );
  }
}

class InputEmail extends StatelessWidget {
  final TextEditingController? controller;
  const InputEmail({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "Email",
        fillColor: inputFormBgColor,
        filled: true,
        border: InputBorder.none,
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Email is required";
        }
        if (!value.contains('@')) {
          return "Please enter a valid email";
        }
        return null;
      },
    );
  }
}

// Input password
class InputPassword extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const InputPassword({super.key, this.controller, this.validator});

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            hintText: "Password",
            fillColor: inputFormBgColor,
            filled: true,
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
          validator:
              widget.validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return "Password is required";
                }
                if (value.length < 6) {
                  return "Password must be at least 6 characters";
                }
                return null;
              },
        ),
      ],
    );
  }
}

// Confirm password
class ConfirmPassword extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const ConfirmPassword({super.key, this.controller, this.validator});

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            hintText: "Confirm password",
            fillColor: inputFormBgColor,
            filled: true,
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
          validator:
              widget.validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return "Please confirm password";
                }
                return null;
              },
        ),
      ],
    );
  }
}

class InputRole extends StatelessWidget {
  final TextEditingController? controller;
  const InputRole({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "Role",
        fillColor: inputFormBgColor,
        filled: true,
        border: InputBorder.none,
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Role is required";
        }
        return null;
      },
    );
  }
}
