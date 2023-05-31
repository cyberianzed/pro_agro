import 'package:get/get.dart';
import 'booking_controller.dart';

class BookingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProduceController>(() => ProduceController());
  }
}
