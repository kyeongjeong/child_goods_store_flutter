import 'package:child_goods_store_flutter/blocs/profile/profile_tab_bloc.dart';
import 'package:child_goods_store_flutter/blocs/profile/profile_tab_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/chat_item_type.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTabReview extends StatefulWidget {
  final GlobalKey<ExtendedNestedScrollViewState> nestedScrollKey;

  const ProfileTabReview({
    super.key,
    required this.nestedScrollKey,
  });

  @override
  State<ProfileTabReview> createState() => _ProfileTabReviewState();
}

class _ProfileTabReviewState extends State<ProfileTabReview>
    with AutomaticKeepAliveClientMixin<ProfileTabReview> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels >=
            notification.metrics.maxScrollExtent) {
          // _loadData();
        }
        return false;
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            sliver: BlocBuilder<ProfileTabBloc, ProfileTabState>(
              builder: (context, state) => SliverList.separated(
                itemBuilder: (context, index) => Container(
                  color: Colors.amber,
                  child: AppFont('Review $index'),
                ),
                separatorBuilder: (context, index) => Gaps.v16,
                itemCount: 20,
              ),
            ),
          ),
          _retryWidget(),
        ],
      ),
    );
  }

  Widget _retryWidget() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
        child: Center(
          child: BlocBuilder<ProfileTabBloc, ProfileTabState>(
            builder: (context, state) {
              if (state.category == EChatItemType.product &&
                      state.myProductsStatus == ELoadingStatus.error ||
                  state.category == EChatItemType.together &&
                      state.myTogethersStatus == ELoadingStatus.error) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (state.category == EChatItemType.product)
                      AppFont(
                        state.myProductsMessage ?? Strings.unknownFail,
                      ),
                    if (state.category == EChatItemType.together)
                      AppFont(
                        state.myTogethersMessage ?? Strings.unknownFail,
                      ),
                    Gaps.v20,
                    const AppInkButton(
                      // onTap: () => _loadData(force: true),
                      child: AppFont(
                        '재시도',
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
