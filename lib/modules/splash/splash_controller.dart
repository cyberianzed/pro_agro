import 'package:get/get.dart';
import '../auth/boarding_screen.dart';
import '../pages/botomscreen/bottom_screens.dart';
import '../../controllers/auth_controller.dart';

class SplashController extends GetxController {
  final AuthController authController = Get.put(AuthController());

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () {
      // Check the user's authentication state
      if (authController.auth.currentUser != null) {
        // If the user is logged in, navigate to the home screen
        Get.offAll(() => PersistentBottomView());
      } else {
        // If the user is not logged in, navigate to the boarding screen
        Get.offAll(() => const BoardingScreen());
      }
    });
  }
}
