import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/models/child/child_model.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_profile_image.dart';
import 'package:flutter/material.dart';

class ChildIconButton extends StatelessWidget {
  final ChildModel child;
  final bool isSelected;
  final Function()? onTap;

  const ChildIconButton({
    super.key,
    required this.child,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                AppProfileImage(
                  profileImg: child.childImg,
                  radius: Sizes.size32,
                ),
                if (isSelected)
                  Container(
                    width: Sizes.size64,
                    height: Sizes.size64,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: Sizes.size5,
                      ),
                      borderRadius: BorderRadius.circular(Sizes.size32),
                    ),
                  ),
              ],
            ),
            Gaps.v5,
            AppFont(child.name ?? Strings.nullStr),
          ],
        ),
      ),
    );
  }
}
