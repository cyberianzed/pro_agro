import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomViewController extends GetxController {
  PersistentTabController persistentTab =
      PersistentTabController(initialIndex: 0);
}
