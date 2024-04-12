import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/routes.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/chat_item_type.dart';
import 'package:child_goods_store_flutter/models/purchase/purchase_model.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/app_network_image.dart';
import 'package:child_goods_store_flutter/utils/other_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PurchaseListItem extends StatelessWidget {
  final PurchaseModel purchase;

  const PurchaseListItem({
    super.key,
    required this.purchase,
  });

  void _pushItem(BuildContext context) {
    if (purchase.category == EChatItemType.product) {
      context.push('${Routes.productDetail}/${purchase.id}');
    }
    if (purchase.category == EChatItemType.together) {
      context.push('${Routes.togetherDetail}/${purchase.id}');
    }
  }

  void _pushReview(BuildContext context) {
    print('Push review for ${purchase.id}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(Sizes.size10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.1),
            blurRadius: Sizes.size3,
            spreadRadius: Sizes.size1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 150,
            child: AppInkButton(
              onTap: () => _pushItem(context),
              padding: const EdgeInsets.all(Sizes.size5),
              borderRadSize: 0,
              color: Colors.transparent,
              shadowColor: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size5),
                      ),
                      child: AppNetworkImage(
                        profileImg: purchase.image,
                        height: 150,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size10,
                      ),
                      decoration: const BoxDecoration(),
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Gaps.v5,
                            AppFont(
                              purchase.name ?? Strings.nullStr,
                              maxLine: 1,
                            ),
                            Gaps.v5,
                            const AppFont(
                              '구매가',
                              fontSize: Sizes.size7,
                            ),
                            AppFont(
                              '${purchase.price?.price()}원',
                              fontWeight: FontWeight.w700,
                            ),
                            const AppFont(
                              '판매자',
                              fontSize: Sizes.size7,
                            ),
                            AppFont(
                              purchase.sellerName ?? Strings.nullStr,
                              maxLine: 1,
                            ),
                            const AppFont(
                              '거래일',
                              fontSize: Sizes.size7,
                            ),
                            AppFont(purchase.saleCompleteDate
                                .toString()
                                .split(' ')
                                .first),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: Sizes.size5),
                      child: Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.black87.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (purchase.isReview != true)
            AppInkButton(
              onTap: () => _pushReview(context),
              borderRadSize: 0,
              child: const AppFont(
                '리뷰 남기기',
                color: Colors.white,
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
