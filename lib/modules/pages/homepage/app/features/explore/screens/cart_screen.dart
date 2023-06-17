import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/services/model/product.dart';
import '../../product/views/screens/product_detail_screen.dart';
import '../controllers/explore_controller.dart';

class CartPage extends GetView<ExploreController> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Colors.black,
        leadingWidth: 150,
        leading: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            CustomBackButton(onPressed: () => controller.back()),
          ],
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.cartProducts.length,
          itemBuilder: (context, index) {
            final Product product = controller.cartProducts[index];
            final int itemId =
                Random().nextInt(100000); // Generate a random item ID
            return Card(
              child: ListTile(
                leading: Image(
                  image: controller.cartProducts[index].images[0],
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'item ID: $itemId', // Display the random item ID
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey), // Adjust the font size
                    ),
                  ],
                ),
                subtitle: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => controller.decrementQuantity(index),
                    ),
                    Obx(() => Text(
                          controller.cartQuantities[index].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        )),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => controller.incrementQuantity(index),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red, // Set the delete button color to red
                      onPressed: () => controller.removeFromCart(index),
                    ),
                    const Expanded(child: SizedBox()),
                    Obx(() => Text(
                          '₹ ${controller.cartProducts[index].price * controller.cartQuantities[index]}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          padding: const EdgeInsets.all(16),
          color: Colors.grey[300],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ₹ ${controller.totalPrice.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add your buy button functionality here
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 50), // Adjust button padding
                  textStyle:
                      const TextStyle(fontSize: 18), // Adjust button text size
                ),
                child: const Text('Buy'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
