import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/services/model/product.dart';
import '../../product/views/screens/product_detail_screen.dart';
import '../controllers/explore_controller.dart';
import 'package:pro_agro/modules/pages/homepage/app/features/explore/screens/checkout_page.dart';

class CartPage extends GetView<ExploreController> {
  CartPage({Key? key}) : super(key: key);
  final ExploreController _explorecontroller = Get.put(ExploreController());
  Widget bottomBarTitle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Total",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          ),
          Obx(
            () => Text(
              "₹${_explorecontroller.totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomBarButton() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
          ),
          onPressed: _explorecontroller.cartProducts.isEmpty
              ? null
              : () {
                  Get.to(() => CheckoutPage(totalPrice: '55'));
                },
          child: const Text("Buy Now"),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 150,
        leading: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            CustomBackButton(onPressed: () => _explorecontroller.back()),
          ],
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: _explorecontroller.cartProducts.length,
          itemBuilder: (context, index) {
            final Product product = _explorecontroller.cartProducts[index];
            final int itemId =
                Random().nextInt(100000); // Generate a random item ID
            return Card(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SizedBox(
                        // height: 120,
                        width: 120,
                        child: Image.network(
                          _explorecontroller.cartProducts[index].images[0],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Item ID: $itemId', // Display the random item ID
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () =>
                                    _explorecontroller.decrementQuantity(index),
                              ),
                              Obx(() => Text(
                                    _explorecontroller.cartQuantities[index]
                                        .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () =>
                                    _explorecontroller.incrementQuantity(index),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                color: Colors.red,
                                onPressed: () =>
                                    _explorecontroller.removeFromCart(index),
                              ),
                              const Expanded(child: SizedBox()),
                              Obx(() => Text(
                                    '₹${_explorecontroller.cartProducts[index].price * _explorecontroller.cartQuantities[index]}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            bottomBarTitle(),
            bottomBarButton(),
          ],
        ),
      ),
    );
  }
}
