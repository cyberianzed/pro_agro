import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/ui/app_snackbar.dart';
import '../../product/views/screens/product_detail_screen.dart';

class FavoriteProduct {
  final String imageurl;
  final double price;
  final String name;

  FavoriteProduct({
    required this.imageurl,
    required this.price,
    required this.name,
  });
}

class FavoritesController extends GetxController {
  final RxList<FavoriteProduct> favoriteProducts = <FavoriteProduct>[].obs;

  void changeFavoriteProduct(FavoriteProduct product, bool favorite) {
    if (favorite) {
      favoriteProducts.add(product);
    } else {
      favoriteProducts.remove(product);
    }
    AppSnackbar.showStatusFavoriteProduct(
      imageurl: product.imageurl,
      productName: product.name,
      isFavorite: favorite,
    );
  }

  void addFavoriteProduct(FavoriteProduct product) {
    favoriteProducts.add(product);
  }

  void removeFavoriteProduct(FavoriteProduct product) {
    favoriteProducts.remove(product);
  }
}

class Favorites extends GetView<FavoritesController> {
  Favorites({Key? key}) : super(key: key);
  final FavoritesController _favoritesController =
      Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 150,
        leading: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            CustomBackButton(onPressed: () => Get.back()),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Favorites',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 19),
            ),
          ],
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: _favoritesController.favoriteProducts.length,
          itemBuilder: (context, index) {
            final FavoriteProduct product =
                _favoritesController.favoriteProducts[index];
            final int itemId =
                Random().nextInt(100000); // Generate a random item ID
            return Card(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SizedBox(
                        // height: 120,
                        width: 120,
                        child: Image.network(
                          product.imageurl,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Item ID: $itemId', // Display the random item ID
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '₹${product.price}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
