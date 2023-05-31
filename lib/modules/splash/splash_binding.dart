import 'package:get/get.dart';
import 'package:pro_agro/modules/splash/splash_controller.dart';
import '../../controllers/auth_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
