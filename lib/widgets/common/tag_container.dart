import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:flutter/material.dart';

class TagContainer extends StatelessWidget {
  final String tag;

  const TagContainer({
    super.key,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.size28,
      margin: const EdgeInsets.only(right: Sizes.size5),
      padding: const EdgeInsets.only(right: Sizes.size10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size20),
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            blurRadius: Sizes.size1,
            spreadRadius: Sizes.size1 / 3,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            height: Sizes.size28,
            padding: const EdgeInsets.only(
              left: Sizes.size7,
              right: Sizes.size5,
            ),
            child: const Center(
              child: AppFont(
                '#',
                fontWeight: FontWeight.w900,
                fontSize: Sizes.size18,
                color: Colors.white,
              ),
            ),
          ),
          Gaps.h5,
          AppFont(tag),
        ],
      ),
    );
  }
}
