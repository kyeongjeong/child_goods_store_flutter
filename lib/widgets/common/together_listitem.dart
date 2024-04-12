import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/routes.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/models/together/together_preview_model.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/app_network_image.dart';
import 'package:flutter/material.dart';
import 'package:child_goods_store_flutter/utils/other_extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TogetherListItem extends StatelessWidget {
  final TogetherPreviewModel together;

  const TogetherListItem({
    super.key,
    required this.together,
  });

  void _pushTogether(BuildContext context) {
    context.push('${Routes.togetherDetail}/${together.togetherId}');
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
                padding: const EdgeInsets.only(
                  top: Sizes.size10,
                  right: Sizes.size10,
                ),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: Sizes.size10),
                        child: AppFont(
                          together.togetherName ?? Strings.nullStr,
                          maxLine: 1,
                        ),
                      ),
                      Gaps.v10,
                      LinearPercentIndicator(
                        padding: const EdgeInsets.only(left: Sizes.size10),
                        percent: (together.purchaseNum ?? 0) /
                            (together.totalNum ?? 1),
                        barRadius: const Radius.circular(Sizes.size5),
                        lineHeight: Sizes.size5,
                        progressColor: Theme.of(context).primaryColor,
                        backgroundColor: Colors.black.withOpacity(0.05),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: Sizes.size10),
                        child: AppFont(
                          '모집 수량: ${together.purchaseNum?.price()} / ${together.totalNum?.price()}',
                          fontSize: Sizes.size12,
                        ),
                      ),
                      Gaps.v5,
                      _item(
                        context,
                        title: '총 가격',
                        body: together.totalPrice?.price() ?? '-',
                      ),
                      _item(
                        context,
                        title: '목표 단가',
                        body: together.purchasePrice?.price() ?? '-',
                      ),
                      _item(
                        context,
                        title: '마감일',
                        body: together.deadline?.toString().split(' ').first ??
                            Strings.nullStr,
                        wonUnit: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    required String title,
    required String body,
    bool wonUnit = true,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(Sizes.size10),
            ),
          ),
          child: AppFont(
            title,
            color: Colors.white,
            fontSize: Sizes.size10,
          ),
        ),
        Gaps.h5,
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: AppFont(
                  body,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.right,
                ),
              ),
              if (wonUnit)
                const AppFont(
                  '원',
                  fontWeight: FontWeight.w700,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
