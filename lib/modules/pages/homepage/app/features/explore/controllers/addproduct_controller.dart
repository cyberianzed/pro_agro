import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProductController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  TextEditingController expiryController = TextEditingController(); // Added
  final RxList<File> selectedImages = <File>[].obs;
  RxString selectedCategory = ''.obs;

  Future<void> pickImages(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> imageList = await picker.pickMultiImage(imageQuality: 85);

    if (imageList.isNotEmpty) {
      selectedImages.value =
          imageList.map((XFile image) => File(image.path)).toList();
    } else {}
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

  void setSelectedCategory(String category) {
    selectedCategory.value = category;
  }

  Future<void> addProduct() async {
    // Retrieve the input values
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
    final CollectionReference categoryCollection =
        FirebaseFirestore.instance.collection(selectedCategory.value);

// Create a new document ID
    final newProductDoc = productsCollection.doc();

// Add the product to the general "products" collection
    await newProductDoc.set({
      'id': newProductDoc.id, // Add the document ID as a field
      'name': name,
      'username': GetStorage().read('username'),
      'price': price,
      'images': imageUrllist,
      'description': description,
      'isFavorite': false,
      'expiry': expiryController.text,
      'category': selectedCategory.value,
    });

// Add the product to the category collection
    await categoryCollection.doc(newProductDoc.id).set({
      'name': name,
      'username': GetStorage().read('username'),
      'price': price,
      'images': imageUrllist,
      'description': description,
      'isFavorite': false,
      'expiry': expiryController.text,
      'category': selectedCategory.value,
    });

    // Clear input fields and selected images
    nameController.clear();
    priceController.clear();
    descriptionController.clear();
    selectedImages.clear();
    expiryController.clear();

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
