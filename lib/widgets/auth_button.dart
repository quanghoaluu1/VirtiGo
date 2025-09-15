
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:virtigo/config/app_colors.dart';

class AuthButton extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;

  const AuthButton({
    super.key,
  required this.text,
  required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: AppColors.button,
        ),
        onPressed: onPressed,
        child: Text(
          text.tr(),
          style: const TextStyle(
            fontFamily: 'Beiruti',
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      )
    );
  }
}