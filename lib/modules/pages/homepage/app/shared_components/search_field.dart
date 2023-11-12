import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constans/app_constants.dart';
import '../features/explore/controllers/explore_controller.dart';
import '../utils/services/model/product.dart';

class SearchField extends StatelessWidget {
  SearchField({this.onSearch, Key? key}) : super(key: key);

  final controller = TextEditingController();
  final ExploreController _controller = Get.put(ExploreController());
  final Function(List<Product> products)? onSearch;

  // Define a function to handle the search action
  Future<void> _handleSearch() async {
    final String searchQuery = controller.text;
    if (onSearch != null) {
      final List<Product> searchResults =
          await _controller.searchProducts(searchQuery);
      _controller.searchQuery.value = searchQuery;
      onSearch!(searchResults);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search),
        hintText: "What are you looking for",
      ),
      onEditingComplete:
          _handleSearch, // Call _handleSearch on editing complete
      textInputAction: TextInputAction.search,
      style: TextStyle(color: Colors.grey[800]),
    );
  }
}
