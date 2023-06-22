import 'package:get/get.dart';
import '../../../../../../../routes/app_routes.dart';
import '../../../utils/services/model/product.dart';
import '../../../utils/services/src/product_service.dart';
import '../../../utils/services/src/user_service.dart';
import '../screens/favorites_screen.dart';

class ExploreController extends GetxController {
  final ProductService productService = ProductService();

  final UserService userService = UserService();
  final FavoritesController favoritesController =
      Get.put(FavoritesController());
  Future<List<Product>> getAllProduct() async {
    return productService.getAll();
  }

  Future<List<Product>> getAgroProduce() async {
    return productService.getAgroProduce();
  }
  Future<List<Product>> getLiveStock() async {
    return productService.getLiveStock();
  }
  Future<List<Product>> getFarmMachinery() async {
    return productService.getFarmMachinery();
  }
  Future<List<Product>> getHotDeals() async {
    return productService.getHotDeals();
  }

  void back() {
    Get.back();
  }

  void addToFavorites(FavoriteProduct product) {
    favoritesController.addFavoriteProduct(product);
  }

  void removeFromFavorites(FavoriteProduct product) {
    favoritesController.removeFavoriteProduct(product);
  }

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

    refresh();
  }

  void removeFromCart(int index) {
    cartProducts.removeAt(index);
    cartQuantities.removeAt(index);
    refresh();
  }

  void incrementQuantity(int index) {
    cartQuantities[index]++;
    refresh();
  }

  void decrementQuantity(int index) {
    if (cartQuantities[index] > 1) {
      cartQuantities[index]--;
    }
    refresh();
  }

  void goToDetailProduct(Product product) {
    Get.toNamed("${Routes.product}/${product.id}");
  }
}
