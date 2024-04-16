import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/enums/child_age.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:flutter/material.dart';

class ProductDetailAgeWidget extends StatelessWidget {
  final EChildAge? age;

  const ProductDetailAgeWidget({
    super.key,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.circular(Sizes.size20),
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size3,
              horizontal: Sizes.size10,
            ),
            child: const AppFont(
              '적정 연령',
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
            child: AppFont(
              age?.text ?? EChildAge.allAge,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
