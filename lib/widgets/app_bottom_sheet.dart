import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:flutter/material.dart';

class AppBottomSheet extends BottomSheet {
  const AppBottomSheet({
    super.key,
    required super.onClosing,
    required super.builder,
  });

  static show(
    BuildContext context, {
    required Widget child,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppFont(
            '뒤로가기, 또는 빈 곳을 탭하여 닫기',
            fontSize: Sizes.size10,
            color: Colors.white,
          ),
          Gaps.v10,
          Container(
            margin: EdgeInsets.only(
              bottom: MediaQuery.paddingOf(context).bottom,
              left: Sizes.size20,
              right: Sizes.size20,
            ),
            padding: const EdgeInsets.all(Sizes.size20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Sizes.size20),
            ),
            width: double.infinity,
            child: child,
          ),
        ],
      ),
    );
  }
}
