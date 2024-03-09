import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:flutter/material.dart';

class AppProfileImage extends StatelessWidget {
  final String? profileImg;
  final double radius;

  const AppProfileImage({
    super.key,
    this.profileImg,
    this.radius = Sizes.size20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.size80,
      height: Sizes.size80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
      ),
      clipBehavior: Clip.hardEdge,
      child: profileImg == null || profileImg == Strings.nullStr
          ? const Icon(
              Icons.person,
              size: Sizes.size60,
              color: Colors.white,
            )
          : Image.network(
              profileImg!,
              fit: BoxFit.cover,
            ),
    );
  }
}
