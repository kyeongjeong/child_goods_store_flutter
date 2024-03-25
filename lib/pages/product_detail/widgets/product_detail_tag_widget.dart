import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:flutter/material.dart';

class ProductDetailTagWidget extends StatelessWidget {
  final List<String> tags;

  const ProductDetailTagWidget({
    super.key,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
          child: AppFont(
            '태그',
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Gaps.v5,
        SizedBox(
          height: Sizes.size32,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _tag(context, tag: tags[index]),
            separatorBuilder: (context, index) => Gaps.h5,
            itemCount: tags.length,
          ),
        ),
      ],
    );
  }

  Widget _tag(
    BuildContext context, {
    required String tag,
  }) {
    return Container(
      height: Sizes.size32,
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.circular(Sizes.size20),
      ),
      child: Center(
        child: AppFont(tag),
      ),
    );
  }
}
