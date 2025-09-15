import 'package:get/get.dart';
import '../pages/welcome_page.dart';
import 'app_routes.dart';


class AppPage {
  static final pages = [
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomePage(),
    )
  ];
}