import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/routes.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/models/user/user_profile_model.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailProfileWidget extends StatelessWidget {
  final UserProfileModel profile;

  const ProductDetailProfileWidget({
    super.key,
    required this.profile,
  });

  void _onTapProfile(BuildContext context) {
    context.push('${Routes.profile}/${profile.userId}');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _onTapProfile(context),
      child: Row(
        children: [
          AppProfileImage(
            profileImg: profile.profileImg,
            radius: Sizes.size32,
          ),
          Gaps.h20,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppFont(profile.nickName ?? Strings.nullStr),
              Gaps.v5,
              const AppFont('평점'),
            ],
          ),
        ],
      ),
    );
  }
}
