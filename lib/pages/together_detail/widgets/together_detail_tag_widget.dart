import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/common/tag_container.dart';
import 'package:flutter/material.dart';

class TogetherDetailTagWidget extends StatelessWidget {
  final List<String> tags;

  const TogetherDetailTagWidget({
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
          height: Sizes.size28,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => TagContainer(tag: tags[index]),
            itemCount: tags.length,
          ),
        ),
      ],
    );
  }
}
