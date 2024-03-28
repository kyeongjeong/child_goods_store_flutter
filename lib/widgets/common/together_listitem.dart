import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/models/together/together_preview_model.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/app_network_image.dart';
import 'package:flutter/material.dart';
import 'package:child_goods_store_flutter/utils/other_extensions.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TogetherListItem extends StatelessWidget {
  final TogetherPreviewModel together;

  const TogetherListItem({
    super.key,
    required this.together,
  });

  void _pushTogether(BuildContext context) {
    // TODO: push page to together detail page
    print('push page to /together/${together.togetherId}');
    // context.push('${Routes.productDetail}/${product.productId}');
  }

  @override
  Widget build(BuildContext context) {
    return AppInkButton(
      onTap: () => _pushTogether(context),
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Positioned.fill(
                    child: AppNetworkImage(
                      profileImg: together.togetherImage,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [0, 0.2],
                        colors: [
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0.5),
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0),
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
                      together.togetherHeart == true
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(Sizes.size10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppFont(together.togetherName ?? Strings.nullStr),
                    Gaps.v5,
                    AppFont(
                      '총 가격: ${together.totalPrice?.price()} 원',
                      fontWeight: FontWeight.w700,
                    ),
                    AppFont(
                      '목표 단가: ${together.purchasePrice?.price()} 원',
                      fontWeight: FontWeight.w700,
                    ),
                    Gaps.v3,
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      percent: (together.purchaseNum ?? 0) /
                          (together.totalNum ?? 1),
                      barRadius: const Radius.circular(Sizes.size5),
                      lineHeight: Sizes.size10,
                      progressColor: Theme.of(context).primaryColor,
                      backgroundColor: Colors.black.withOpacity(0.1),
                    ),
                    AppFont(
                        '모집 수량: ${together.purchaseNum?.price()} / ${together.totalNum?.price()}'),
                    Gaps.v3,
                    AppFont(
                        '마감: ${together.deadline?.toString().split(' ').first}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
