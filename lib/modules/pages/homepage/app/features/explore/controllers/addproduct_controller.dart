import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddProductController extends GetxController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final RxList<File> selectedImages = <File>[].obs;

  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> imageList = await picker.pickMultiImage(imageQuality: 85);

    selectedImages.value =
        imageList.map((XFile image) => File(image.path)).toList();
  }

  Future<String?> uploadImage(File image) async {
    final firebase_storage.Reference storageRef =
        firebase_storage.FirebaseStorage.instance.ref().child('images');

    // Generate a unique filename for the image
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
    final String userName = userNameController.text;
    final String name = nameController.text;
    final double price = double.parse(priceController.text);
    final String description = descriptionController.text;

    List<String?> imageUrllist = [];

    for (File image in selectedImages) {
      String? imageUrl = await uploadImage(image);
      imageUrllist.add(imageUrl);
    }

    // Create a new product document
    final CollectionReference productsCollection =
        FirebaseFirestore.instance.collection('products');
    await productsCollection.add({
      'name': name,
      'price': price,
      'username': userName,
      'images': imageUrllist,
      'description': description,
      'isFavorite': false
    });

    // Clear the text fields and selected images
    userNameController.clear();
    nameController.clear();
    priceController.clear();
    descriptionController.clear();
    selectedImages.clear();

    // Show a success message
    Get.dialog(
      AlertDialog(
        title: const Text('Success'),
        content: const Text('Product added successfully!'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
