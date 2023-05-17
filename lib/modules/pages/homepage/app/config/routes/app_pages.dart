import 'package:get/get.dart';

import '../../features/product/product_detail/views/screens/product_detail_screen.dart';
part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened this page will be the first to be shown
  static const initial = Routes.dashboard;

  static final routes = [
    GetPage(
      name: "${_Paths.product}/:id",
      page: () => const ProductDetailScreen(),
      binding: ProductDetailBinding(),
      transition: Transition.downToUp,
    )
  ];
}
