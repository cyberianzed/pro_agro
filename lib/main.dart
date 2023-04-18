import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_agro/modules/auth/bottom_screens.dart';
import './controllers/auth_controller.dart';
import 'controllers/splash_controller.dart';
import 'modules/auth/splash_screen.dart';

// This code is initializing the Firebase
// app and ensuring that the WidgetsFlutterBinding is initialized.
// The Firebase.initializeApp()
// method is called to initialize the Firebase app and connect it to the Firebase backend.
// The .then() function is used to ensure that the AuthController()
// is put into the Get object after the Firebase app is initialized.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  Get.put(SplashController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/home', page: () => PersistentBottomView()),
      ],
    );
  }
}
