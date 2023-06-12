library explore;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pro_agro/modules/pages/homepage/app/features/filter/ProductFilterPage.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../../../constans/app_constants.dart';
import '../../../shared_components/filter_button.dart';
import '../../../shared_components/product_card.dart';
import '../../../shared_components/search_field.dart';
import '../../../utils/services/model/product.dart';
import '../../product/views/screens/product_detail_screen.dart';
import '../controllers/explore_controller.dart';
import 'cart_screen.dart';

// binding
// part '../../bindings/explore_binding.dart';

// component
part '../views/components/product_content.dart';
part '../views/components/tab_bar_content.dart';

class ExploreScreen extends GetView<ExploreController> {
  ExploreScreen({Key? key}) : super(key: key);
  final ExploreController _controller = Get.put(ExploreController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                toolbarHeight: 100,
                title: Row(
                  children: [
                    Expanded(
                      child: SearchField(
                        onSearch: (value) {
                          print("search : $value");
                        },
                      ),
                    ),
                    const SizedBox(width: kSpacing),
                    FilterButton(
                      onPressed: () {
                        Get.to(() => ProductFilterPage());
                      },
                    ),
                    CartButton(onPressed: () {
                      // ignore: prefer_const_constructors
                      Get.to(() => CartPage());
                    }),
                  ],
                ),
              )
            ];
          },
          body: _TabBarContent(
            tabs: const [
              Text("All"),
              Text("Agro Produce"),
              Text("Livestock"),
              Text("Farm Machinery"),
              Text("Art"),
              Text("Sporting Goods"),
              Text("Home & Garden"),
            ],
            children: [
              _ProductContent(
                _controller.getAllProduct(),
                onPressed: (product) => _controller.goToDetailProduct(product),
              ),
              _ProductContent(
                _controller.getFashionProduct(),
                onPressed: (product) => _controller.goToDetailProduct(product),
              ),
              const Center(child: Text("Agro Produce")),
              const Center(child: Text("Agro Produce")),
              const Center(child: Text("Agro Produce")),
              const Center(child: Text("Agro Produce")),
              const Center(child: Text("Agro Produce")),
            ],
          ),
        ),
      ),
    );
  }
}
