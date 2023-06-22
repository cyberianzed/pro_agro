import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/addproduct_controller.dart';
import 'addproduct_screen.dart';

class CategorySelectPage extends StatelessWidget {
  final AddProductController _aproductcontroller =
      Get.put(AddProductController());
  CategorySelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Category'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildCategoryCard(
            categoryName: 'Agro Produce',
            icon: Icons.category,
            onTap: () => _navigateToAddProductPage('cat1'),
          ),
          _buildCategoryCard(
            categoryName: 'Livestock',
            icon: Icons.category,
            onTap: () => _navigateToAddProductPage('cat2'),
          ),
          _buildCategoryCard(
              categoryName: 'Farm Machinery',
              icon: Icons.category,
              onTap: () => _navigateToAddProductPage('cat3')),
          _buildCategoryCard(
            categoryName: 'Deals',
            icon: Icons.category,
            onTap: () => _navigateToAddProductPage('cat4'),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard({
    required String categoryName,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64.0,
              color: Colors.green,
            ),
            const SizedBox(height: 8.0),
            Text(
              categoryName,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAddProductPage(String selectedCategory) {
    Get.to(() => AddProductPage(category: selectedCategory));
    _aproductcontroller.setSelectedCategory(selectedCategory);
  }
}
