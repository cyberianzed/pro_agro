class Product {
  final String id;
  final String idUser;
  final String name;
  final double price;
  final String description;
  final List<String> images;
  final bool isFavorite;
  final int totalViews;
  final int totalReview;
  final double rating;

  const Product({
    required this.id,
    required this.idUser,
    required this.images,
    required this.name,
    required this.price,
    required this.isFavorite,
    required this.description,
    required this.totalViews,
    required this.totalReview,
    required this.rating,
  });
}
