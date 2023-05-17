library product_detail;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../constans/app_constants.dart';
import '../../../../../shared_components/custom_icon_button.dart';
import '../../../../../shared_components/indicator.dart';
import '../../../../../utils/services/rest_api_services.dart';
import '../../../../../utils/ui/ui_utils.dart';

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
part '../components/share_button.dart';
part '../components/views_text.dart';

class ProductDetailScreen extends GetView<ProductDetailController> {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () =>
            (controller.data.value == null || controller.dataUser.value == null)
                ? const Center(child: Text("Product or User Not Found"))
                : _buildProductDetail(
                    product: controller.data.value!,
                    user: controller.dataUser.value!,
                  ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(kSpacing / 2),
        child: Row(
          children: [
            const SizedBox(width: kSpacing / 2),
            _ChatButton(onPressed: () {}),
            const SizedBox(width: kSpacing),
            _BuyButton(onPressed: () {}),
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
          controller: controller.scroll,
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
                            _Rating(product.rating),
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
                            trailing: const Icon(Icons.keyboard_arrow_right_rounded),
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
            opacity: controller.opacityActionButton.value,
            duration: const Duration(milliseconds: 200),
            onEnd: () => controller.onEndAnimationActionButton(),
            child: Visibility(
              visible: controller.isVisibleActionButton.value,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 40,
                ),
                child: Row(
                  children: [
                    _BackButton(onPressed: () => controller.back()),
                    const Spacer(),
                    _FavoriteButton(
                      initial: product.isFavorite,
                      onChanged: (favorite) {
                        controller.changeFavoriteProduct(product, favorite);
                      },
                    ),
                    const SizedBox(width: 15),
                    _ShareButton(onPressed: () {}),
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
