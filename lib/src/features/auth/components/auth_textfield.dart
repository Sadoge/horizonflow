import 'package:flutter/material.dart';
import 'package:horizonflow/src/core/constants/colors.dart';
import 'package:horizonflow/src/core/constants/text_styles.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

  const AuthTextField({
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        style: medium.copyWith(color: AppColors.textDark),
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: medium,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          fillColor: AppColors.textField,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFE8ECEF),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFE8ECEF),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFE8ECEF),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
}
