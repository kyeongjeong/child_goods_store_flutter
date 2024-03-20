import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/routes.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/models/product/product_preview_model.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/app_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:child_goods_store_flutter/utils/extensions.dart';

class ProductListItem extends StatelessWidget {
  final ProductPreviewModel product;

  const ProductListItem({
    super.key,
    required this.product,
  });

  void _pushProduct(BuildContext context) {
    context.push('${Routes.productDetail}/${product.productId}');
  }

  @override
  Widget build(BuildContext context) {
    return AppInkButton(
      onTap: () => _pushProduct(context),
      padding: EdgeInsets.zero,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: AppNetworkImage(
                  profileImg: product.productImage,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Sizes.size10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppFont(
                      '${product.price?.price()} 원',
                      fontWeight: FontWeight.w700,
                    ),
                    Gaps.v3,
                    AppFont(
                      '${product.productName}',
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: const [0, 0.2],
                colors: [
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: Sizes.size5,
              right: Sizes.size5,
            ),
            child: Icon(
              product.productHeart == true
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
