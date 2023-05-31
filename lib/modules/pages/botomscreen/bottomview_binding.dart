
import 'package:get/get.dart';

import 'bottomview_controller.dart';

class BottomViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomViewController());
  }
}
