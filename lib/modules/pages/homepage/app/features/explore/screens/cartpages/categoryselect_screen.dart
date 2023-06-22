import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../product/views/screens/product_detail_screen.dart';
import '../../controllers/explore_controller.dart';
import '../../controllers/addproduct_controller.dart';
import 'addproduct_screen.dart';

class CategorySelectPage extends StatelessWidget {
  final AddProductController _aproductcontroller =
      Get.put(AddProductController());
  final ExploreController _explorecontroller = Get.put(ExploreController());
  CategorySelectPage({Key? key}) : super(key: key);

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Select Product Category',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                _buildCategoryCard(
                  categoryName: 'Agro Produce',
                  imagePath: 'assets/images/agro_produce.png',
                  onTap: () => _navigateToAddProductPage('cat1'),
                ),
                _buildCategoryCard(
                  categoryName: 'Livestock',
                  imagePath: 'assets/images/livestock.png',
                  onTap: () => _navigateToAddProductPage('cat2'),
                ),
                _buildCategoryCard(
                  categoryName: 'Farm Machinery',
                  imagePath: 'assets/images/farm_machinery.png',
                  onTap: () => _navigateToAddProductPage('cat3'),
                ),
                _buildCategoryCard(
                  categoryName: 'Deals',
                  imagePath: 'assets/images/deals.png',
                  onTap: () => _navigateToAddProductPage('cat4'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard({
    required String categoryName,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 64.0,
              height: 64.0,
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
