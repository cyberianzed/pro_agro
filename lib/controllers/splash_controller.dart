import 'package:get/get.dart';
import '../modules/auth/bottom_screens.dart';
import 'auth_controller.dart';

class SplashController extends GetxController {
  final AuthController authController = Get.find();

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      // Check the user's authentication state
      if (authController.auth.currentUser != null) {
        // If the user is logged in, navigate to the home screen
        Get.offAll(() => PersistentBottomView(
            // email: authController.auth.currentUser!.email ?? "email null",
            ));
      } else {
        // If the user is not logged in, navigate to the boarding screen
        // Get.offAll(() => const BoardingScreen());
      }
    });
  }
}
