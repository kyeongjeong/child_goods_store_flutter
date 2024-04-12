import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/routes.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/models/user/user_model.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/app_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FollowUserCard extends StatelessWidget {
  final UserModel user;

  const FollowUserCard({
    super.key,
    required this.user,
  });

  void _onUserTap(BuildContext context) {
    context.pushReplacement('${Routes.profile}/${user.userId}');
  }

  @override
  Widget build(BuildContext context) {
    return AppInkButton(
      onTap: () => _onUserTap(context),
      color: Theme.of(context).scaffoldBackgroundColor,
      shadowColor: Colors.transparent,
      borderRadSize: 0,
      child: Row(
        children: [
          AppProfileImage(
            profileImg: user.profileImg,
            radius: Sizes.size32,
          ),
          Gaps.h10,
          Expanded(
            child: AppFont(
              user.nickName ?? Strings.nullStr,
              maxLine: 2,
            ),
          ),
        ],
      ),
    );
  }
}
