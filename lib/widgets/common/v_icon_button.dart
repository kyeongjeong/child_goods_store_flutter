import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_profile_image.dart';
import 'package:flutter/material.dart';

class VIconButton extends StatelessWidget {
  final String? image;
  final IconData? icon;
  final String title;

  final bool isSelected;
  final bool isStack;
  final Function()? onTap;

  const VIconButton({
    super.key,
    this.image,
    this.icon,
    required this.title,
    this.isSelected = false,
    this.isStack = false,
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
                if (icon == null)
                  AppProfileImage(
                    profileImg: image,
                    radius: Sizes.size32,
                  ),
                if (icon != null)
                  Container(
                    width: Sizes.size64,
                    height: Sizes.size64,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Icon(
                      icon,
                      color: isStack
                          ? Colors.black54.withOpacity(0.3)
                          : Colors.black54,
                      size: Sizes.size32,
                    ),
                  ),
                if (isSelected)
                  Container(
                    width: Sizes.size64,
                    height: Sizes.size64,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withOpacity(0.1),
                        width: Sizes.size5,
                      ),
                      borderRadius: BorderRadius.circular(Sizes.size32),
                    ),
                  ),
                if (isStack)
                  Positioned.fill(
                    child: Center(
                      child: AppFont(
                        title,
                        textAlign: TextAlign.center,
                        fontSize: Sizes.size12,
                        fontWeight: FontWeight.w700,
                        shadows: const [
                          Shadow(
                            color: Colors.white,
                            blurRadius: Sizes.size3,
                          ),
                          Shadow(
                            color: Colors.white,
                            blurRadius: Sizes.size3,
                          ),
                          Shadow(
                            color: Colors.white,
                            blurRadius: Sizes.size10,
                          ),
                          Shadow(
                            color: Colors.white,
                            blurRadius: Sizes.size10,
                          ),
                          Shadow(
                            color: Colors.white,
                            blurRadius: Sizes.size20,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            if (!isStack)
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Gaps.v5,
                  AppFont(
                    title,
                    textAlign: TextAlign.center,
                    fontSize: Sizes.size12,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
