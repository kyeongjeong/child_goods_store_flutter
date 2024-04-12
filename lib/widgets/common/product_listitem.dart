import 'dart:ui';
import 'package:child_goods_store_flutter/constants/routes.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/models/product/product_preview_model.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/app_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:child_goods_store_flutter/utils/other_extensions.dart';

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
          Padding(
            padding: const EdgeInsets.only(bottom: Sizes.size40),
            child: AppNetworkImage(
              profileImg: product.productImage,
              height: double.infinity,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: Sizes.size40),
              height: Sizes.size20,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                ),
              ),
            ),
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
            padding: const EdgeInsets.all(Sizes.size5),
            child: Icon(
              product.productHeart == true
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              color: Colors.redAccent,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: Sizes.size5,
                  sigmaY: Sizes.size5,
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(Sizes.size10),
                  color: Colors.black.withOpacity(0.3),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: AppFont(
                              product.price?.price() ?? '-',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              textAlign: TextAlign.right,
                            ),
                          ),
                          const AppFont(
                            '원',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      AppFont(
                        '${product.productName}',
                        maxLine: 2,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
