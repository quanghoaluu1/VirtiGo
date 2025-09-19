import 'package:flutter/material.dart';
import 'package:virtigo/config/app_colors.dart';
import 'package:get/get.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final void Function(String)? onChange;

   const AuthTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.suffixIcon,
    this.keyboardType,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
          hintText: hintText.tr,
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