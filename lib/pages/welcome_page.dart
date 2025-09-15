import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:virtigo/config/app_colors.dart';

import '../utils/gradient_text.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: GradientText(
                "VIRTIGO",
                style: const TextStyle(
                  fontSize: 60,
                  fontFamily: 'Baloo',
                  fontWeight: FontWeight.bold,
                ),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF00FFA1),
                    Color(0xFF00E1FF),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          // const SizedBox(height: 80),
          // const Spacer(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00E5FF), Color(0xFF00C853)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'welcome'.tr(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF097083),
                    fontFamily: 'Baloo',
                  ),
                ),
                // const SizedBox(height: 24),
                Text(
                  'quote'.tr(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF097083),
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    fontFamily: 'Beiruti',
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      'login'.tr(),
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      'register'.tr(),
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Divider(color: Colors.white54),
                const SizedBox(height: 16),
                // Social login row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialIcon("assets/icons/google_icon.png"),
                    const SizedBox(width: 20),
                    _socialIcon("assets/icons/facebook_icon.png"),
                    const SizedBox(width: 20),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(String assetPath) {
    return Container(
      width: 80,
      height: 40,
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(15)),
      child: Center(child: Image.asset(assetPath, width: 24, height: 24)),
    );
  }
}
