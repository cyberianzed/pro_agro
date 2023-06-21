import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pro_agro/modules/pages/botomscreen/bottomview_controller.dart';
import '../../../utils/color_constants.dart';
import '../bookingpage/booking_page.dart';
import '../communitypage/community_page.dart';
import '../events_page.dart';
import '../homepage/app/features/explore/screens/explore_screen.dart';
import '../profilepage/profile_page.dart';

class PersistentBottomView extends GetView<BottomViewController> {
  PersistentBottomView({super.key});
  final BottomViewController _controller = Get.put(BottomViewController());

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller.persistentTab,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}

List<Widget> _buildScreens() {
  return [
    ExploreScreen(),
    const EventsPage(),
    BookingPage(),
    CommunityPage(),
    ProfilePage()
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(
        FontAwesomeIcons.house,
      ),
      title: ("Home"),
      activeColorPrimary: ColorConstants.green,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.calendar_view_day_rounded),
      title: ("Events"),
      activeColorPrimary: ColorConstants.green,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        FontAwesomeIcons.moneyBillWheat,
        color: Color.fromARGB(255, 11, 104, 59),
      ),
      title: ("Booking"),
      activeColorPrimary: Colors.red.withOpacity(.25),
      // activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.black,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(FontAwesomeIcons.handHoldingHand),
      title: ("Community"),
      activeColorPrimary: ColorConstants.green,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        FontAwesomeIcons.solidUser,
      ),
      title: ("Profile"),
      activeColorPrimary: ColorConstants.green,
      inactiveColorPrimary: Colors.grey,
    ),
  ];
}
