import 'package:virtigo/services/translation_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtigo/routes/app_pages.dart';
import 'package:virtigo/routes/app_routes.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("Firebase initializing...");
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }else{
    Firebase.app();
  }
  print("Firebase initialized");
await AppTranslations.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'VirtiGo',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.welcome,
      translations: AppTranslations(),
      locale: const Locale('vi', 'VN'),
      fallbackLocale: const Locale('vi', 'VN'),
      getPages: AppPage.pages,
    );
  }
}
