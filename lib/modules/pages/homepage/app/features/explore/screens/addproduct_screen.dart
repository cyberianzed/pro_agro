import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/addproduct_controller.dart';

class AddProductPage extends GetView<AddProductController> {
  AddProductPage({super.key});
  final AddProductController _controller = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _controller.pickImages,
              child: const Text('Select Images'),
            ),
            const SizedBox(height: 16.0),
            Obx(
              () => GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: _controller.selectedImages.length,
                itemBuilder: (BuildContext context, int index) {
                  final File image = _controller.selectedImages[index];
                  return Image.file(image);
                },
              ),
            ),
            TextField(
              controller: _controller.userNameController,
              decoration: const InputDecoration(
                labelText: 'User Name',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _controller.nameController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _controller.priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Price',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _controller.descriptionController,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _controller.addProduct,
              child: const Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
