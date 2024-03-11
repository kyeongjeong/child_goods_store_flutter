import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:flutter/material.dart';

class AppProfileImage extends StatelessWidget {
  final String? profileImg;
  final double radius;

  const AppProfileImage({
    super.key,
    this.profileImg,
    this.radius = Sizes.size40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
      ),
      clipBehavior: Clip.hardEdge,
      child: profileImg == null || profileImg == Strings.nullStr
          ? Icon(
              Icons.person,
              size: radius,
              color: Colors.white,
            )
          : Image.network(
              profileImg!,
              fit: BoxFit.cover,
            ),
    );
  }
}
