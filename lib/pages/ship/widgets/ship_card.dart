import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/routes.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/address_category.dart';
import 'package:child_goods_store_flutter/models/address/address_model.dart';
import 'package:child_goods_store_flutter/models/go_router_extra_model.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShipCard extends StatelessWidget {
  final AddressModel address;

  const ShipCard({
    super.key,
    required this.address,
  });

  void _onTap(BuildContext context) {
    context.push(
      Routes.editAddress,
      extra: GoRouterExtraModel<AddressModel>(data: address),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Sizes.size10),
      child: AppInkButton(
        onTap: () => _onTap(context),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size2,
                horizontal: Sizes.size5,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(Sizes.size5),
              ),
              child: AppFont(
                address.category?.text ?? EAddressCategory.etc.text,
                color: Colors.white,
              ),
            ),
            Gaps.v3,
            AppFont(address.address ?? Strings.nullStr),
            AppFont(address.detailAddress ?? Strings.nullStr),
          ],
        ),
      ),
    );
  }
}
