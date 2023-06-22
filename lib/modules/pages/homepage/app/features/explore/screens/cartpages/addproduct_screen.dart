import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/addproduct_controller.dart';

class AddProductPage extends GetView<AddProductController> {
  final String category;
  final AddProductController _aproductcontroller =
      Get.put(AddProductController());

  AddProductPage({Key? key, required this.category}) : super(key: key);

  Future<void> _selectExpiryDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      _aproductcontroller.expiryController.text =
          pickedDate.toString().split(' ')[0];
    }
  }

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
            Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () => _aproductcontroller.pickImages(context),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 40.0,
                    color: Colors.green,
                  ),
                ),
              ),
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
                itemCount: _aproductcontroller.selectedImages.length,
                itemBuilder: (BuildContext context, int index) {
                  final File image = _aproductcontroller.selectedImages[index];
                  return Image.file(
                    image,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _aproductcontroller.nameController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _aproductcontroller.priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _aproductcontroller.descriptionController,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _aproductcontroller.expiryController,
              decoration: InputDecoration(
                labelText: 'Expiry Date',
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black87, // Adjust the color of the outline
                    width: 2.0,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color:
                        Colors.red, // Adjust the color of the focused outline
                    width: 2.0,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.calendar_today,
                    color:
                        Colors.green, // Adjust the color of the calendar icon
                  ),
                  onPressed: () => _selectExpiryDate(context),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                ),
                onPressed: _aproductcontroller.addProduct,
                child: const Text("Add Product"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
