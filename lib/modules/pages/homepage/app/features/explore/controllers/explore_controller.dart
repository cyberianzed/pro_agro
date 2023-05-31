import 'package:get/get.dart';
import '../../../../../../../routes/app_routes.dart';
import '../../../utils/services/model/product.dart';
import '../../../utils/services/src/product_service.dart';

class ExploreController extends GetxController {
  final productService = ProductService();

  List<Product> getAllProduct() => productService.getAll();
  List<Product> getFashionProduct() => productService.getFashion();

  void goToDetailProduct(Product product) {
    Get.toNamed("${Routes.product}/${product.id}");
  }
}
