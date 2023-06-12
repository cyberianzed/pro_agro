import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/services/model/product.dart';
import '../controllers/explore_controller.dart';


class CartPage extends GetView<ExploreController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.cartProducts.length,
          itemBuilder: (context, index) {
            final Product product = controller.cartProducts[index];
            final int quantity = controller.cartQuantities[index];
            final double totalPrice = product.price * quantity;

            return ListTile(
              leading: Container(
                width: 50,
                height: 50,
                child: Image(
                  image: controller.cartProducts[index].images[0],
                ),
              ),
              title: Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => controller.decrementQuantity(index),
                  ),
                  Text(quantity.toString()),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => controller.incrementQuantity(index),
                  ),
                  SizedBox(width: 16),
                  Text(
                    '\$${totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
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
          padding: EdgeInsets.all(16),
          color: Colors.grey[300],
          child: Text(
            'Total: \$${controller.totalPrice.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
