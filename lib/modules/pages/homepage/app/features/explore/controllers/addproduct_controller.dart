import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProductController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  TextEditingController expiryController = TextEditingController(); // Added
  TextEditingController uploadDateController = TextEditingController(); // Added
  final RxList<File> selectedImages = <File>[].obs;
  RxString selectedCategory = ''.obs;

  Future<void> pickImages(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> imageList = await picker.pickMultiImage(imageQuality: 85);

    if (imageList.isNotEmpty) {
      selectedImages.value =
          imageList.map((XFile image) => File(image.path)).toList();
    } else {
      Get.snackbar('Add image', "no image added");
    }
  }

  Future<String?> uploadImage(File image) async {
    final firebase_storage.Reference storageRef =
        firebase_storage.FirebaseStorage.instance.ref().child('images');

    final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    final originalFilename = image.path.split('/').last;
    final fileName = '${timestamp}_$originalFilename';

    final firebase_storage.UploadTask uploadTask =
        storageRef.child(fileName).putFile(image);
    final firebase_storage.TaskSnapshot snapshot = await uploadTask;
    final String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<void> addProduct() async {
    final String name = nameController.text;
    final double price = double.tryParse(priceController.text) ?? 0.0;
    final String description = descriptionController.text;

    if (selectedImages.isEmpty) {
      Get.snackbar(
        'No Image',
        "Please select at least one image",
        colorText: Colors.white,
        backgroundColor: Colors.brown,
      );

      return;
    }

    List<String?> imageUrllist = [];

    for (File image in selectedImages) {
      String? imageUrl = await uploadImage(image);
      imageUrllist.add(imageUrl);
    }

    final CollectionReference productsCollection =
        FirebaseFirestore.instance.collection('products');

    await productsCollection.add({
      'name': name,
      'price': price,
      'images': imageUrllist,
      'description': description,
      'isorite': false,
    });

    nameController.clear();
    priceController.clear();
    descriptionController.clear();
    selectedImages.clear();

    Get.defaultDialog(
      title: 'Success',
      middleText: 'Product added successfully!',
      textConfirm: 'OK',
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
        // Refresh ExploreScreen after adding the product
        Get.offAndToNamed('/explore');
      },
    );
  }
}
