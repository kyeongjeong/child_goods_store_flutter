import 'package:child_goods_store_flutter/blocs/auth/auth_bloc_singleton.dart';
import 'package:child_goods_store_flutter/blocs/profile/profile_tab_bloc.dart';
import 'package:child_goods_store_flutter/blocs/profile/profile_tab_event.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/routes.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/chat_item_type.dart';
import 'package:child_goods_store_flutter/models/go_router_extra_model.dart';
import 'package:child_goods_store_flutter/models/review/review_model.dart';
import 'package:child_goods_store_flutter/widgets/app_bottom_sheet.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/app_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ReviewListItem extends StatefulWidget {
  final ReviewModel review;

  const ReviewListItem({
    super.key,
    required this.review,
  });

  @override
  State<ReviewListItem> createState() => _ReviewListItemState();
}

class _ReviewListItemState extends State<ReviewListItem> {
  void _pushUser() {
    if (widget.review.userId == AuthBlocSingleton.bloc.state.user?.userId) {
      return;
    }
    context.push('${Routes.profile}/${widget.review.userId}');
  }

  void _pushItem() {
    if (widget.review.type == EChatItemType.product) {
      context.push('${Routes.productDetail}/${widget.review.id}');
    }
    if (widget.review.type == EChatItemType.together) {
      context.push('${Routes.togetherDetail}/${widget.review.id}');
    }
  }

  void _onTapMore() {
    AppBottomSheet.show(
      context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppInkButton(
            onTap: () async {
              context.pop();
              await _updateReview();
            },
            color: Colors.transparent,
            shadowColor: Colors.transparent,
            child: const Center(
              child: AppFont('후기 수정'),
            ),
          ),
          AppInkButton(
            onTap: () {
              context.pop();
              _deleteReview();
            },
            color: Colors.transparent,
            shadowColor: Colors.transparent,
            child: const Center(
              child: AppFont(
                '후기 삭제',
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _updateReview() async {
    var res = await context.push<GoRouterExtraModel<ReviewModel>>(
      Routes.editReview,
      extra: GoRouterExtraModel<ReviewModel>(
        data: widget.review,
        itemId: widget.review.id,
        itemType: widget.review.type,
      ),
    );

    // Update review item's score & content
    if (res?.data != null && mounted) {
      context.read<ProfileTabBloc>().add(ProfileTabReviewUpdate(res!.data!));
    }
  }

  void _deleteReview() {
    context.read<ProfileTabBloc>().add(ProfileTabReviewDelete(widget.review));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(Sizes.size10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.1),
            blurRadius: Sizes.size3,
            spreadRadius: Sizes.size1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(Sizes.size10),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: _pushUser,
                    behavior: HitTestBehavior.translucent,
                    child: Row(
                      children: [
                        AppProfileImage(
                          profileImg: widget.review.userImage,
                          radius: Sizes.size20,
                        ),
                        Gaps.h10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AppFont(
                                widget.review.userName ?? Strings.nullStr,
                                maxLine: 1,
                              ),
                              Row(
                                children: [
                                  AppFont(
                                    '평균 별점 ${widget.review.averageStars?.toStringAsFixed(1)}',
                                    fontSize: Sizes.size12,
                                  ),
                                  Gaps.h5,
                                  const Icon(
                                    Icons.circle,
                                    size: Sizes.size3,
                                  ),
                                  Gaps.h5,
                                  AppFont(
                                    '리뷰 ${widget.review.totalReview}',
                                    fontSize: Sizes.size12,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (widget.review.userId ==
                    AuthBlocSingleton.bloc.state.user?.userId)
                  Padding(
                    padding: const EdgeInsets.only(left: Sizes.size10),
                    child: AppInkButton(
                      onTap: _onTapMore,
                      padding: EdgeInsets.zero,
                      borderRadSize: Sizes.size20,
                      color: Colors.transparent,
                      shadowColor: Colors.transparent,
                      child: const SizedBox(
                        width: Sizes.size40,
                        height: Sizes.size40,
                        child: Center(child: Icon(Icons.more_vert_rounded)),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size7),
            child: _star(
              context,
              score: widget.review.score,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppFont(widget.review.content ?? Strings.nullStr),
                Gaps.v5,
                AppFont(
                  widget.review.createdAt.toString().split(' ').first,
                  color: Colors.black38,
                  fontSize: Sizes.size12,
                ),
              ],
            ),
          ),
          Gaps.v12,
          AppInkButton(
            onTap: _pushItem,
            borderRadSize: 0,
            child: Row(
              children: [
                Expanded(
                  child: AppFont(
                    widget.review.name ?? Strings.nullStr,
                    color: Colors.white,
                    maxLine: 1,
                  ),
                ),
                Gaps.h5,
                const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _star(BuildContext context, {int? score}) {
    return Row(
      children: [
        for (int i = 1; i <= 5; i++)
          Icon(
            (score ?? 0) >= i ? Icons.star_rounded : Icons.star_border_rounded,
            size: Sizes.size20,
            color: Colors.yellow.shade700,
          ),
      ],
    );
  }
}
