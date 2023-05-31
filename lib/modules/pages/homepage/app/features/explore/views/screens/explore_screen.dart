library explore;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../../../../../../../../routes/app_routes.dart';
import '../../../../constans/app_constants.dart';
import '../../../../shared_components/filter_button.dart';
import '../../../../shared_components/product_card.dart';
import '../../../../shared_components/search_field.dart';
import '../../../../utils/services/model/product.dart';
import '../../controllers/explore_controller.dart';

// binding
// part '../../bindings/explore_binding.dart';

// component
part '../components/product_content.dart';
part '../components/tab_bar_content.dart';

class ExploreScreen extends GetView<ExploreController> {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void goToDetailProduct(Product product) {
      Get.toNamed("${Routes.product}/${product.id}");
    }

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
                      onPressed: () {},
                    ),
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
                controller.getAllProduct(),
                onPressed: (product) => goToDetailProduct(product),
              ),
              _ProductContent(
                controller.getFashionProduct(),
                onPressed: (product) => goToDetailProduct(product),
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
