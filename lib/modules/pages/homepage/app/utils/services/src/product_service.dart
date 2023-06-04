import 'package:flutter/material.dart';
import '../../../constans/app_constants.dart';
import '../model/product.dart';

class ProductService {
  static final ProductService _singleton = ProductService._internal();

  factory ProductService() {
    return _singleton;
  }

  ProductService._internal();

  Product? getProductByID(String id) {
    final allProducts = getAll();
    final result = allProducts.where((product) => product.id == id).toList();
    return result.isNotEmpty ? result[0] : null;
  }

  List<Product> getAll() {
    return [
      _organicFertilizer,
      _pestControlSpray,
      _fruitSeeds,
      _vegetableSeeds,
      _gardeningTools,
      _plantPots,
    ];
  }

  List<Product> getAgroProduce() {
    return [
      _organicFertilizer,
      _pestControlSpray,
      _fruitSeeds,
      _vegetableSeeds,
      _gardeningTools,
      _plantPots,
    ];
  }

  final _organicFertilizer = Product(
    id: "12345",
    idUser: "fwg123",
    images: [
      AssetImage(ImageRasterPath.organicFertilizer),
    ],
    name: "Organic Fertilizer",
    price: 15.99,
    isFavorite: false,
    description:
        "Improve the quality of your crops with our organic fertilizer. It is made from natural ingredients and enhances soil fertility, promoting healthy plant growth. Suitable for all types of crops.",
    totalViews: 100,
    totalReview: 20,
    rating: 4.5,
  );

  final _pestControlSpray = Product(
    id: "23456",
    idUser: "fwg345",
    images: [
      AssetImage(ImageRasterPath.pestControlSpray),
    ],
    name: "Pest Control Spray",
    price: 12.99,
    isFavorite: true,
    description:
        "Protect your plants from pests and diseases with our effective pest control spray. It eliminates a wide range of insects and provides long-lasting protection for your crops. Safe for both indoor and outdoor use.",
    totalViews: 200,
    totalReview: 30,
    rating: 4.2,
  );

  final _fruitSeeds = Product(
    id: "34567",
    idUser: "fwg123",
    images: [
      AssetImage(ImageRasterPath.fruitSeeds),
    ],
    name: "Fruit Seeds Pack",
    price: 9.99,
    isFavorite: false,
    description:
        "Start your own fruit garden with our high-quality fruit seeds pack. It includes a variety of fruit seeds suitable for different climates. Enjoy fresh and delicious fruits grown in your own backyard.",
    totalViews: 150,
    totalReview: 15,
    rating: 4.8,
  );

  final _vegetableSeeds = Product(
    id: "45678",
    idUser: "fwg345",
    images: [
      AssetImage(ImageRasterPath.vegetableSeeds),
    ],
    name: "Vegetable Seeds Pack",
    price: 8.99,
    isFavorite: true,
    description:
        "Grow your own vegetables with our vegetable seeds pack. It contains a selection of popular vegetable seeds that are easy to grow and maintain. Enjoy fresh and nutritious vegetables straight from your garden.",
    totalViews: 180,
    totalReview: 25,
    rating: 4.6,
  );

  final _gardeningTools = Product(
    id: "56789",
    idUser: "fwg123",
    images: [
      AssetImage(ImageRasterPath.gardeningTools),
    ],
    name: "Gardening Tools Set",
    price: 24.99,
    isFavorite: true,
    description:
        "Equip yourself with our gardening tools set for all your gardening needs. The set includes essential tools like a shovel, rake, pruning shears, and more. Made from durable materials for long-lasting use.",
    totalViews: 250,
    totalReview: 40,
    rating: 4.9,
  );

  final _plantPots = Product(
    id: "67890",
    idUser: "fwg345",
    images: [
      AssetImage(ImageRasterPath.plantPots),
    ],
    name: "Plant Pots Assortment",
    price: 6.99,
    isFavorite: false,
    description:
        "Enhance the beauty of your plants with our assortment of plant pots. They come in different sizes, styles, and colors to suit your preferences. Made from high-quality materials for durability.",
    totalViews: 120,
    totalReview: 10,
    rating: 4.3,
  );
}
