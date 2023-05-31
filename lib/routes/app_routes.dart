import 'package:get/get.dart';
import '../modules/auth/bottom_screens.dart';
import '../modules/auth/splash_screen.dart';
import '../modules/pages/homepage/app/features/dashboard/explore/views/screens/explore_screen.dart';
import '../modules/pages/homepage/app/features/product/product_detail/views/screens/product_detail_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/splash', page: () => const SplashScreen()),
    GetPage(name: '/home', page: () => PersistentBottomView()),
    
    GetPage(
      name: '/explore',
      page: () => ExploreScreen(),
      binding: ExploreBinding(),
    ),
    GetPage(
      name: "${Routes.product}/:id",
      page: () => const ProductDetailScreen(),
      binding: ProductDetailBinding(),
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

