import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constans/app_constants.dart';

/// contains all snackbar templates
class AppSnackbar {
  static void showStatusFavoriteProduct({
    required ImageProvider productImage,
    required String productName,
    required bool isFavorite,
  }) {
    Get.snackbar(
      (isFavorite) ? "add to favorites" : "removed from favorites",
      productName,
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Image(
          image: productImage,
          fit: BoxFit.cover,
        ),
      ),
      colorText: kFontColorPallets[0],
      duration: const Duration(seconds: 1),
      isDismissible: true,
      backgroundColor: Colors.white,
    );
  }

  static void showSuccess(String message) {
    Get.snackbar(
      'Success',
      message,
      icon: Icon(Icons.check_circle, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: Duration(seconds: 2),
    );
  }
}
