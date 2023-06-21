import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/product.dart';

class ProductService {
  static final ProductService _singleton = ProductService._internal();

  factory ProductService() {
    return _singleton;
  }

  ProductService._internal();

  Future<Product?> getProductByID(String id) async {
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('products').doc(id).get();
    if (snapshot.exists) {
      final data = snapshot.data();
      if (data != null) {
        final product = Product(
          id: id,
          idUser: 'fwg123',
          images: List<String>.from(data['images']),
          name: data['name'],
          price: data['price'].toDouble(),
          isFavorite: data['isFavorite'],
          description: data['description'],
          totalViews: Random().nextInt(100),
          totalReview: Random().nextInt(30),
          rating: (Random().nextDouble() * 5).toPrecision(1),
        );
        return product;
      }
    }
    return null;
  }

  Future<List<Product>> getAll() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('products').get();
    final List<Product> products = [];
    for (final doc in snapshot.docs) {
      final data = doc.data();
      final product = Product(
        id: doc.id,
        idUser: Random().nextBool() ? 'fwg123' : 'fwg345',
        images: List<String>.from(data['images']),
        name: data['name'],
        price: data['price'].toDouble(),
        isFavorite: data['isFavorite'],
        description: data['description'],
        totalViews: Random().nextInt(100),
        totalReview: Random().nextInt(30),
        rating: (Random().nextDouble() * 5).toPrecision(1),
      );
      products.add(product);
    }
    return products;
  }

  Future<List<Product>> getAgroProduce() async {
    // Implementation similar to getAll() but with specific conditions/filtering
    final List<Product> agroProduce = [];
    // Fetch and filter products accordingly
    return agroProduce;
  }

  Future<List<Product>> getHotDeals() async {
    // Implementation similar to getAll() but with specific conditions/filtering
    final List<Product> hotDeals = [];
    // Fetch and filter products accordingly
    return hotDeals;
  }
}
