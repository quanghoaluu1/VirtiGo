import 'package:flutter/material.dart';
import 'package:virtigo/pages/login_page.dart';
import 'package:virtigo/themes/gradient_background.dart';
import 'package:virtigo/widgets/social_button.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';
import '../controllers/auth_controller.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_textfield.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Scaffold(
      body: Stack(
          children: [
             GradientBackground(height: 220),
            SingleChildScrollView(
                padding:  EdgeInsets.symmetric(
                    horizontal: 20, vertical: 60),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 150,),
                      Text('signup'.tr,
                        style: TextStyle(
                          fontFamily: 'Baloo',
                            color: AppColors.button,
                            fontSize: 50,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 8,),
                      Text('signup_quote'.tr,
                      style:  TextStyle(
                        color: AppColors.primary,
                        fontFamily: 'Beiruti',
                        fontWeight: FontWeight.w500,
                        fontSize: 20

                      ),),
                      const SizedBox(height: 20,),

                       AuthTextField(hintText: 'username', keyboardType: TextInputType.name,
                       onChange: (v) => controller.username.value = v,),
                      const SizedBox(height: 16,),
                       AuthTextField(
                         hintText: 'email',
                         keyboardType: TextInputType.emailAddress,
                       onChange: (v) => controller.email.value = v,),
                      const SizedBox(height: 16,),
                       AuthTextField(
                        hintText: 'password',
                        obscureText: true,
                        suffixIcon: Icons.visibility_off,
                         onChange: (v) => controller.password.value = v,
                      ),
                      const SizedBox(height: 16,),
                       AuthTextField(
                        hintText: 'confirm_password',
                        obscureText: true,
                        suffixIcon: Icons.visibility_off,
                      ),
                      const SizedBox(height: 12,),

                      Row(
                        children: [
                          Checkbox(
                            value: true,
                              focusColor: AppColors.button,
                              checkColor: Colors.white,
                              activeColor: AppColors.button,
                              onChanged: (val) {}),
                          Text('receive_notification'.tr,
                          style:  TextStyle(
                              color: AppColors.button,
                            fontSize: 20,
                            fontFamily: 'Beiruti'
                          )),
                        ],
                      ),
                      const SizedBox(height: 16,),

                      AuthButton(text: 'signup'.tr, onPressed: () => controller.register()),
                      const SizedBox(height: 16,),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('already_have_account'.tr, style:  TextStyle(color: AppColors.light),),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) =>
                                        LoginPage()),
                                  );
                                },
                                child: Text('login'.tr,
                                  style:  TextStyle(
                                    color: AppColors.primary,
                                  ),
                                )
                            )
                          ]
                      ),
                      const SizedBox(height: 20,),

                      Row(
                        children:  [
                          Expanded(child: Divider(color: AppColors.primary,)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text("hoặc", style: TextStyle(color: AppColors.button),),
                          ),
                          Expanded(child: Divider(color: AppColors.primary,)),
                        ],
                      ),
                      const SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialButton(
                              assetPath: "assets/icons/google_icon.png",
                              onPressed: () {}
                          ),
                          const SizedBox(width: 50),
                          SocialButton(
                              assetPath: "assets/icons/facebook_icon.png",
                              onPressed: () {}
                          ),
                        ],
                      )
                    ]
                )
            )
          ]
      ),
    );
  }

}