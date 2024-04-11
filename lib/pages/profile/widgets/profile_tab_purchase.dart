import 'package:child_goods_store_flutter/blocs/profile/profile_tab_bloc.dart';
import 'package:child_goods_store_flutter/blocs/profile/profile_tab_event.dart';
import 'package:child_goods_store_flutter/blocs/profile/profile_tab_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/chat_item_type.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/purchase/purchase_model.dart';
import 'package:child_goods_store_flutter/pages/profile/widgets/profile_tab_category_dropdown.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/common/purchase_listitem.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTabPurchase extends StatefulWidget {
  final GlobalKey<ExtendedNestedScrollViewState> nestedScrollKey;

  const ProfileTabPurchase({
    super.key,
    required this.nestedScrollKey,
  });

  @override
  State<ProfileTabPurchase> createState() => _ProfileTabPurchaseState();
}

class _ProfileTabPurchaseState extends State<ProfileTabPurchase>
    with AutomaticKeepAliveClientMixin<ProfileTabPurchase> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _initLoadData();
  }

  void _initLoadData() {
    var bloc = context.read<ProfileTabBloc>();
    if (bloc.state.purchaseProductsStatus == ELoadingStatus.init &&
        bloc.state.category == EChatItemType.product) {
      _loadData();
    }
    if (bloc.state.purchaseTogethersStatus == ELoadingStatus.init &&
        bloc.state.category == EChatItemType.together) {
      _loadData();
    }
  }

  void _loadData({bool force = false}) {
    var bloc = context.read<ProfileTabBloc>();
    if (bloc.state.category == EChatItemType.product) {
      if (bloc.state.purchaseProductsStatus != ELoadingStatus.error || force) {
        bloc.add(ProfileTabGetPurchaseProducts());
      }
    } else {
      if (bloc.state.purchaseTogethersStatus != ELoadingStatus.error || force) {
        bloc.add(ProfileTabGetPurchaseTogethers());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels >=
            notification.metrics.maxScrollExtent) {
          _loadData();
        }
        return false;
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const ProfileTabCategoryDropdown(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            sliver: BlocConsumer<ProfileTabBloc, ProfileTabState>(
              listenWhen: (previous, current) =>
                  previous.category != current.category,
              listener: (context, state) {
                _initLoadData();
              },
              builder: (context, state) {
                if (state.category == EChatItemType.product) {
                  return _itemList(state.purchaseProducts);
                }
                return _itemList(state.purchaseTogethers);
              },
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
                      state.purchaseProductsStatus == ELoadingStatus.error ||
                  state.category == EChatItemType.together &&
                      state.purchaseTogethersStatus == ELoadingStatus.error) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (state.category == EChatItemType.product)
                      AppFont(
                        state.purchaseProductsMessage ?? Strings.unknownFail,
                      ),
                    if (state.category == EChatItemType.together)
                      AppFont(
                        state.purchaseTogethersMessage ?? Strings.unknownFail,
                      ),
                    Gaps.v20,
                    AppInkButton(
                      onTap: () => _loadData(force: true),
                      child: const AppFont(
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

  Widget _itemList(List<PurchaseModel> items) {
    return SliverList.separated(
      itemBuilder: (context, index) => PurchaseListItem(
        purchase: items[index],
      ),
      separatorBuilder: (context, index) => Gaps.v16,
      itemCount: items.length,
    );
  }
}
