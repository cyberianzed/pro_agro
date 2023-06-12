import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/services/model/product.dart';
import '../controllers/explore_controller.dart';

class CartPage extends GetView<ExploreController> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.cartProducts.length,
          itemBuilder: (context, index) {
            final Product product = controller.cartProducts[index];
            final int quantity = controller.cartQuantities[index];
            final double totalPrice =
                controller.cartProducts[index].price * quantity;

            return ListTile(
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Image(
                  image: controller.cartProducts[index].images[0],
                ),
              ),
              title: Text(
                product.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => controller.decrementQuantity(index),
                  ),
                  Obx(() => Text(controller.cartQuantities[index].toString())),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => controller.incrementQuantity(index),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '₹ ${totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => controller.removeFromCart(index),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          padding: const EdgeInsets.all(16),
          color: Colors.grey[300],
          child: Text(
            'Total: ₹ ${controller.totalPrice.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
