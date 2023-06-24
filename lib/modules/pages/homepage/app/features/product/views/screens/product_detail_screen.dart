library product_detail;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pro_agro/modules/pages/homepage/app/features/explore/controllers/explore_controller.dart';
import '../../../../constans/app_constants.dart';
import '../../../../shared_components/custom_icon_button.dart';
import '../../../../shared_components/indicator.dart';
import '../../../../utils/services/model/product.dart';
import '../../../../utils/services/model/user.dart';
import '../../../../utils/services/src/product_service.dart';
import '../../../../utils/services/src/user_service.dart';
import '../../../../utils/ui/app_snackbar.dart';
import '../../../explore/screens/cartpages/cart_screen.dart';
import '../../../explore/screens/favorites_screen.dart';
// binding
part '../../bindings/product_detail_binding.dart';

// controller
part '../../controllers/product_detail_controller.dart';

// component
part '../components/back_button.dart';
part '../components/favorite_button.dart';
part '../components/buy_button.dart';
part '../components/chat_button.dart';
part '../components/name_text.dart';
part '../components/body_content.dart';
part '../components/description_text.dart';
part '../components/price_text.dart';
part '../components/product_image.dart';
part '../components/rating.dart';
part '../components/review_text.dart';
part '../components/views_text.dart';

class ProductDetailScreen extends GetView<ProductDetailController> {
  ProductDetailScreen({Key? key}) : super(key: key);
  final ProductDetailController _pdetailcontroller =
      Get.put(ProductDetailController());
  final ExploreController _explorecontroller = Get.put(ExploreController());

  @override
  Widget build(BuildContext context) {
    // debugPrint(_pdetailcontroller.toString());
    return Scaffold(
      body: Obx(
        () => (_pdetailcontroller.data.value == null ||
                _pdetailcontroller.dataUser.value == null)
            ? Column(
                children: [
                  const Center(child: Text("Product or User Not Found")),
                  CustomDeleteButton(
                      onPressed: () => _pdetailcontroller.onDeleteProduct()),
                ],
              )
            : _buildProductDetail(
                product: _pdetailcontroller.data.value!,
                user: _pdetailcontroller.dataUser.value!,
              ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(kSpacing / 2),
        child: Row(
          children: [
            const SizedBox(width: kSpacing / 2),
            _ViewCartButton(onPressed: () {
              Get.to(() => CartPage());
            }),
            const SizedBox(width: kSpacing),
            _AddCartButton(onPressed: () {
              _explorecontroller.addToCart(_pdetailcontroller
                  .data.value!); // Call addToCart method in the controller
              AppSnackbar.showSuccessProduct(
                imageurl: _explorecontroller.cartProducts[0].images[0],
                productName: _explorecontroller.cartProducts[0].name,
              );
            }),
            const SizedBox(width: kSpacing / 2),
          ],
        ),
      ),
    );
  }

  Widget _buildProductDetail({required Product product, required User user}) {
    return Stack(
      children: [
        // DETAIL CONTENT
        SingleChildScrollView(
          controller: _pdetailcontroller.scroll,
          child: Column(
            children: [
              Stack(
                children: [
                  // BACKGROUND IMAGES
                  Hero(tag: product.id, child: _ProductImage(product.images)),

                  // BODY
                  _BodyContent(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 2,
                              child: _PriceText(product.price.toString()),
                            ),
                            Flexible(
                              flex: 1,
                              child: _ViewsText("${product.totalViews} Views"),
                            ),
                          ],
                        ),
                        const SizedBox(height: kSpacing),
                        _NameText(product.name),
                        const SizedBox(height: kSpacing),
                        Row(
                          children: [
                            Rating(product.rating),
                            const SizedBox(width: kSpacing),
                            const CircleAvatar(
                                radius: 3, backgroundColor: Colors.grey),
                            const SizedBox(width: 5),
                            _ReviewsText("${product.totalReview} Review")
                          ],
                        ),
                        const SizedBox(height: kSpacing * 2),
                        _DescriptionText(product.description),
                        const SizedBox(height: kSpacing),
                        Material(
                          child: ListTile(
                            leading:
                                CircleAvatar(backgroundImage: user.profilImage),
                            title: Text(user.name),
                            subtitle: Text("${user.country} (${user.city})"),
                            trailing:
                                const Icon(Icons.keyboard_arrow_right_rounded),
                            onTap: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),

        // HEADER BUTTON
        Obx(
          () => AnimatedOpacity(
            opacity: _pdetailcontroller.opacityActionButton.value,
            duration: const Duration(milliseconds: 200),
            onEnd: () => _pdetailcontroller.onEndAnimationActionButton(),
            child: Visibility(
              visible: _pdetailcontroller.isVisibleActionButton.value,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 40,
                ),
                child: Row(
                  children: [
                    CustomBackButton(
                        onPressed: () => _pdetailcontroller.back()),
                    const Spacer(),
                    CustomDeleteButton(
                        onPressed: () => _pdetailcontroller.onDeleteProduct()),
                    const SizedBox(width: 15),
                    _FavoriteButton(
                      initial: product.isFavorite,
                      onChanged: (favorite) {
                        Get.find<FavoritesController>().changeFavoriteProduct(
                          FavoriteProduct(
                            imageurl: product.images[0],
                            price: product.price,
                            name: product.name,
                          ),
                          favorite,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
