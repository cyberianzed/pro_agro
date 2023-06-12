import 'package:get/get.dart';
import '../modules/pages/botomscreen/bottom_screens.dart';
import '../modules/splash/splash_screen.dart';
import '../modules/pages/homepage/app/features/explore/screens/explore_screen.dart';
import '../modules/pages/homepage/app/features/product/views/screens/product_detail_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/splash',
      page: () => const SplashScreen(),
      bindings: const [],
    ),
    GetPage(
      name: '/home',
      page: () => PersistentBottomView(),
    ),
    GetPage(
      name: '/explore',
      page: () => ExploreScreen(),
    ),
    GetPage(
      // ignore: prefer_interpolation_to_compose_strings
      name: Routes.product + "/:id",
      page: () => ProductDetailScreen(),
      transition: Transition.downToUp,
    ),
  ];
}

class Routes {
  static const explore = '/explore';
  static const product = '/product';

  // Example :
  // static const index = '/';
  // static const splash = '/splash';
  // static const product = '/product';
  // static const productEdit = '/product/edit';
  // static const productDetail = '/product/detail';
  // static const productAdd = '/product/add';
}
