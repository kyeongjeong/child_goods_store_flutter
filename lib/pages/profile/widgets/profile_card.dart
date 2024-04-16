import 'package:child_goods_store_flutter/blocs/profile/profile_bloc.dart';
import 'package:child_goods_store_flutter/blocs/profile/profile_event.dart';
import 'package:child_goods_store_flutter/blocs/profile/profile_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/routes.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/follow_mode.dart';
import 'package:child_goods_store_flutter/models/user/user_profile_model.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/app_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileCard extends StatelessWidget {
  final UserProfileModel userProfile;
  final bool popAble;

  const ProfileCard({
    super.key,
    required this.userProfile,
    required this.popAble,
  });

  void _onTapSetting(BuildContext context) {
    context.push(Routes.settings);
  }

  void _onTapFollowButton(BuildContext context) {
    context.read<ProfileBloc>().add(ProfileChangeFollow());
  }

  void _onTapFollow(BuildContext context) {
    if (popAble) {
      context.pushReplacement(
        '${Routes.follow}/${userProfile.userId}?mode=${EFollowMode.follower.key}',
      );
    } else {
      context.push(
        '${Routes.follow}/${userProfile.userId}?mode=${EFollowMode.follower.key}',
      );
    }
  }

  void _onTapFollowing(BuildContext context) {
    if (popAble) {
      context.pushReplacement(
        '${Routes.follow}/${userProfile.userId}?mode=${EFollowMode.following.key}',
      );
    } else {
      context.push(
        '${Routes.follow}/${userProfile.userId}?mode=${EFollowMode.following.key}',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.size20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppProfileImage(
                profileImg: userProfile.profileImg,
                radius: Sizes.size36,
              ),
              Gaps.h20,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppFont(
                      userProfile.nickName ?? Strings.nullStr,
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w700,
                    ),
                    AppFont(
                      userProfile.introduce ?? Strings.nullStr,
                      fontSize: Sizes.size12,
                    ),
                  ],
                ),
              ),
              Gaps.h20,
              if (!popAble)
                AppInkButton(
                  onTap: () => _onTapSetting(context),
                  borderRadSize: Sizes.size32,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  child: const Padding(
                    padding: EdgeInsets.all(Sizes.size14),
                    child: Icon(Icons.settings_rounded),
                  ),
                ),
              if (popAble)
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) => AppInkButton(
                    onTap: () => _onTapFollowButton(context),
                    padding: const EdgeInsets.all(Sizes.size10),
                    color: state.userProfile?.isFollowed == true
                        ? null
                        : Theme.of(context).scaffoldBackgroundColor,
                    child: SizedBox(
                      height: Sizes.size24,
                      child: Center(
                        child: AppFont(
                          state.userProfile?.isFollowed == true
                              ? '팔로우 중'
                              : '팔로우',
                          color: state.userProfile?.isFollowed == true
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Gaps.v14,
          Row(
            children: [
              _followButton(
                context,
                onTap: () => _onTapFollow(context),
                text: '팔로워 ${userProfile.followNum ?? 0}',
              ),
              Gaps.h10,
              _followButton(
                context,
                onTap: () => _onTapFollowing(context),
                text: '팔로잉 ${userProfile.followingNum ?? 0}',
              ),
            ],
          ),
          Gaps.v14,
          Row(
            children: [
              const AppFont(
                '평균 별점',
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w700,
              ),
              const Expanded(child: SizedBox()),
              Row(
                children: [
                  Icon(
                    Icons.star_rounded,
                    color: Colors.yellow.shade700,
                  ),
                  AppFont(
                    '${userProfile.averageStars?.toStringAsFixed(1) ?? 0} / 5.0',
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w700,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _followButton(
    BuildContext context, {
    required void Function() onTap,
    required String text,
  }) {
    return Flexible(
      flex: 1,
      child: AppInkButton(
        onTap: onTap,
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.zero,
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.circular(Sizes.size10),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size10,
            horizontal: Sizes.size20,
          ),
          child: Center(
            child: AppFont(text),
          ),
        ),
      ),
    );
  }
}
