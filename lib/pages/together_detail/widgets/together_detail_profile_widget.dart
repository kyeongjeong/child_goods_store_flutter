import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/routes.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/models/user/user_profile_model.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TogetherDetailProfileWidget extends StatelessWidget {
  final UserProfileModel profile;

  const TogetherDetailProfileWidget({
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
          Gaps.h16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: Sizes.size4),
                  child: AppFont(
                    profile.nickName ?? Strings.nullStr,
                    maxLine: 1,
                  ),
                ),
                Gaps.v5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: Colors.yellow.shade700,
                    ),
                    AppFont(
                      '${profile.averageStars?.toStringAsFixed(1) ?? 0} / 5.0',
                      fontSize: Sizes.size14,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
