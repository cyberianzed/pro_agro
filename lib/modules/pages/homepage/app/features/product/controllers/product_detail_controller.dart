part of product_detail;

class ProductDetailController extends GetxController {
  final productService = ProductService();
  final userService = UserService();

  final scroll = ScrollController();
  final opacityActionButton = 1.0.obs;
  final isVisibleActionButton = true.obs;

  final RxList<Product> favoriteProducts = <Product>[].obs;
  final Rx<Product?> data = Rx(null);
  final Rx<User?> dataUser = Rx(null);

  @override
  void onInit() async {
    super.onInit();
    data.value = await _getProduct();
    dataUser.value = _getUser();

    scroll.addListener(onScroll);
  }

  Future<Product?> _getProduct() async {
    String? id = Get.parameters['id'];
    Product? product;
    if (id != null) {
      product = await productService.getProductByID(id);
    }
    return product;
  }

  User? _getUser() {
    String? id = data.value?.idUser;

    User? user;

    if (id != null) {
      user = userService.getUserByID(id);
    }

    return user;
  }

  void onScroll() {
    if (scroll.position.pixels > 100 && opacityActionButton.value == 1) {
      opacityActionButton.value = 0;
    } else if (scroll.position.pixels < 100 && opacityActionButton.value == 0) {
      isVisibleActionButton.value = true;
      opacityActionButton.value = 1;
    }
  }

  void onEndAnimationActionButton() {
    if (opacityActionButton.value == 0) {
      isVisibleActionButton.value = false;
    }
  }

  void back() => Get.back();
  void onDeleteProduct() async {
    // Get the current product ID
    final String productId = data.value?.id ?? '';

    // Fetch the product document to get the category value
    final DocumentSnapshot productSnapshot = await FirebaseFirestore.instance
        .collection('products')
        .doc(productId)
        .get();

    if (productSnapshot.exists) {
      final String category = productSnapshot.get('category');

      // Delete the product document from the Firestore collection
      await ProductService().deleteProduct(productId, category);

      // Show a success message
      Get.snackbar(
        'Delete Image',
        "Delete Image Successful",
        colorText: Colors.white,
        backgroundColor: Colors.brown,
      );

      // Navigate back to the previous screen
      Get.back();

      Get.defaultDialog(
        title: 'Success',
        middleText: 'Product Deleted successfully!',
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
          // Refresh ExploreScreen after deleting the product
          Get.offAndToNamed('/explore');
        },
      );
    } else {
      // Handle the case where the product document doesn't exist
      // Display an error message or perform appropriate actions
    }
  }
}
