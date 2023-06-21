import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_agro/routes/app_routes.dart';
import 'modules/splash/splash_controller.dart';
import 'modules/pages/homepage/app/config/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Get.put(AuthController());
  Get.put(SplashController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.basic,
      title: 'Pro Agro',
      initialRoute: '/splash',
      getPages: AppRoutes.routes,
    );
  }
}
