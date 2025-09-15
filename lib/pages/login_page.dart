import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:virtigo/pages/signup_page.dart';

import '../config/app_colors.dart';
import '../themes/gradient_background.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_textfield.dart';
import '../widgets/social_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientBackground(height: 220),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 150),
                Text(
                  'login'.tr(),
                  style: TextStyle(
                    fontFamily: 'Baloo',
                    color: AppColors.button,
                    fontSize: 50,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'login_quote'.tr(),
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontFamily: 'Beiruti',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),

                const AuthTextField(hintText: 'email', keyboardType: TextInputType.emailAddress,),
                const SizedBox(height: 25),
                const AuthTextField(
                  hintText: 'password',
                  obscureText: true,
                  suffixIcon: Icons.visibility_off,
                ),
                const SizedBox(height: 12),

                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('forgot_password'.tr(),
                    style: TextStyle(
                      color: AppColors.button,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.button,
                      decorationThickness: 2,
                    ),),
                  ),
                ),
                const SizedBox(height: 12),
                AuthButton(text: 'login'.tr(), onPressed: () {}),
                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'dont_have_account'.tr(),
                      style: const TextStyle(color: AppColors.light),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => SignupPage()),
                        );
                      },
                      child: Text(
                        'signup'.tr(),
                        style: const TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Row(
                  children: const [
                    Expanded(child: Divider(color: AppColors.primary)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "hoặc",
                        style: TextStyle(color: AppColors.button),
                      ),
                    ),
                    Expanded(child: Divider(color: AppColors.primary)),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      assetPath: "assets/icons/google_icon.png",
                      onPressed: () {},
                    ),
                    const SizedBox(width: 50),
                    SocialButton(
                      assetPath: "assets/icons/facebook_icon.png",
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
