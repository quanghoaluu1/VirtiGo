import 'package:get/get.dart';
import 'package:virtigo/pages/login_page.dart';
import 'package:virtigo/pages/signup_page.dart';
import '../bindings/auth_binding.dart';
import '../pages/welcome_page.dart';
import 'app_routes.dart';


class AppPage {
  static final pages = [
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomePage(),
      binding: AuthBinding()
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const SignupPage(),
      binding: AuthBinding(),
    )
  ];
}