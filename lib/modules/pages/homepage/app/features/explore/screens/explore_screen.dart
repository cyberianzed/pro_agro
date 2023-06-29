library explore;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pro_agro/modules/pages/homepage/app/features/filter/filterproduct_page.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../../../constans/app_constants.dart';
import '../../../shared_components/filter_button.dart';
import '../../../shared_components/product_card.dart';
import '../../../shared_components/search_field.dart';
import '../../../utils/services/model/product.dart';
import '../controllers/explore_controller.dart';
import 'cartpages/cart_screen.dart';
import 'cartpages/categoryselect_screen.dart';

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
                          debugPrint("search : $value");
                        },
                      ),
                    ),
                    const SizedBox(width: 5),
                    FilterSizeButton(
                      icon: FontAwesomeIcons.sliders,
                      onPressed: () {
                        Get.to(() => const ProductFilterPage());
                      },
                    ),
                    const SizedBox(width: 5),
                    FilterSizeButton(
                      onPressed: () {
                        Get.to(() => CartPage());
                      },
                      icon: FontAwesomeIcons.cartShopping,
                    ),
                  ],
                ),
              )
            ];
          },
          body: _TabBarContent(
            tabs: const [
              Text("All"),
              Text("Hot Deals"),
              Text("Agro Produce"),
              Text("Livestock"),
              Text("Farm Machinery"),
              // Text("Home & Garden"),
            ],
            children: [
              _ProductContent(
                _controller.getAllProduct(),
                onPressed: (product) => _controller.goToDetailProduct(product),
              ),
              _ProductContent(
                _controller.getHotDeals(),
                onPressed: (product) => _controller.goToDetailProduct(product),
              ),
              _ProductContent(
                _controller.getAgroProduce(),
                onPressed: (product) => _controller.goToDetailProduct(product),
              ),
              _ProductContent(
                _controller.getLiveStock(),
                onPressed: (product) => _controller.goToDetailProduct(product),
              ),
              _ProductContent(
                _controller.getFarmMachinery(),
                onPressed: (product) => _controller.goToDetailProduct(product),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.to(() => CategorySelectPage());
          },
          label: const Text('Post'),
          icon: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
