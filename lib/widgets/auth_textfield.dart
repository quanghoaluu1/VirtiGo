import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:virtigo/config/app_colors.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;

  const AuthTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.suffixIcon,
    this.keyboardType
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
          hintText: hintText.tr(),
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.primary
            )
          ),
          focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.button
          )
      )
      ),
    );
  }
}