import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> getDialog(String text) {
  return Get.defaultDialog(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    titlePadding: const EdgeInsets.all(20),
    title: 'Success',
    middleText: text,
    confirm: TextButton(
      onPressed: () {
        Get.back();
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0), // Add the desired padding values
        child: Text('OK'),
      ),
    ),
  );
}

void getConfirmDialog(
    String title, String middleText, VoidCallback onConfirm, bool val) {
  Get.defaultDialog(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    titlePadding: const EdgeInsets.all(20),
    title: title,
    middleText: middleText,
    confirm: TextButton(
      onPressed: onConfirm,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: val ? const Text('OK') : const Text('Contact Now'),
      ),
    ),
    cancel: TextButton(
      onPressed: () {
        Get.back();
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Cancel'),
      ),
    ),
  );
}
