import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constans/app_constants.dart';

/// contains all snackbar templates
class AppSnackbar {
  static void showStatusFavoriteProduct({
    required String imageurl,
    required String productName,
    required bool isFavorite,
  }) {
    Get.snackbar(
      (isFavorite) ? "add to favorites" : "removed from favorites",
      productName,
      icon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Image.network(
            imageurl,
            fit: BoxFit.cover,
          )),
      colorText: kFontColorPallets[0],
      duration: const Duration(seconds: 1),
      isDismissible: true,
      backgroundColor: Colors.white,
    );
  }

  static void showSuccessProduct({
    required String imageurl,
    required String productName,
  }) {
    Get.snackbar(
      "Added to Cart",
      productName,
      icon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Image.network(
            imageurl,
            fit: BoxFit.cover,
          )),
      colorText: kFontColorPallets[0],
      duration: const Duration(seconds: 1),
      isDismissible: true,
      backgroundColor: Colors.white,
    );
  }
}
