import 'package:get/get.dart';
import '../../../../../../../routes/app_routes.dart';
import '../../../utils/services/model/product.dart';
import '../../../utils/services/src/product_service.dart';

class ExploreController extends GetxController {
  final productService = ProductService();

  List<Product> getAllProduct() => productService.getAll();
  List<Product> getFashionProduct() => productService.getAgroProduce();

  // Cart related functions
  RxList<Product> cartProducts = <Product>[].obs;
  RxList<int> cartQuantities = <int>[].obs;

  double get totalPrice {
    double total = 0;
    for (int i = 0; i < cartProducts.length; i++) {
      total += cartProducts[i].price * cartQuantities[i];
    }
    return total;
  }

  void addToCart(Product product) {
    final index = cartProducts.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      cartQuantities[index]++;
    } else {
      cartProducts.add(product);
      cartQuantities.add(1);
    }
  }

  void removeFromCart(int index) {
    cartProducts.removeAt(index);
    cartQuantities.removeAt(index);
  }

  void incrementQuantity(int index) {
    cartQuantities[index]++;
  }

  void decrementQuantity(int index) {
    if (cartQuantities[index] > 1) {
      cartQuantities[index]--;
    }
  }

  void goToDetailProduct(Product product) {
    Get.toNamed("${Routes.product}/${product.id}");
  }
}
