import 'package:child_goods_store_flutter/blocs/profile/profile_tab_bloc.dart';
import 'package:child_goods_store_flutter/blocs/profile/profile_tab_event.dart';
import 'package:child_goods_store_flutter/blocs/profile/profile_tab_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/chat_item_type.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/product/product_preview_model.dart';
import 'package:child_goods_store_flutter/models/together/together_preview_model.dart';
import 'package:child_goods_store_flutter/pages/profile/widgets/profile_tab_category_dropdown.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/common/product_listitem.dart';
import 'package:child_goods_store_flutter/widgets/common/together_listitem.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTabMyItem extends StatefulWidget {
  final GlobalKey<ExtendedNestedScrollViewState> nestedScrollKey;

  const ProfileTabMyItem({
    super.key,
    required this.nestedScrollKey,
  });

  @override
  State<ProfileTabMyItem> createState() => _ProfileTabMyItemState();
}

class _ProfileTabMyItemState extends State<ProfileTabMyItem>
    with AutomaticKeepAliveClientMixin<ProfileTabMyItem> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _initLoadData();
  }

  void _initLoadData() {
    var bloc = context.read<ProfileTabBloc>();
    if (bloc.state.myProductsStatus == ELoadingStatus.init &&
        bloc.state.category == EChatItemType.product) {
      _loadData();
    }
    if (bloc.state.myTogethersStatus == ELoadingStatus.init &&
        bloc.state.category == EChatItemType.together) {
      _loadData();
    }
  }

  void _loadData() {
    var bloc = context.read<ProfileTabBloc>();
    if (bloc.state.category == EChatItemType.product) {
      bloc.add(ProfileTabGetProducts());
    } else {
      bloc.add(ProfileTabGetTogethers());
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
          BlocConsumer<ProfileTabBloc, ProfileTabState>(
            listenWhen: (previous, current) =>
                previous.category != current.category,
            listener: (context, state) {
              _initLoadData();
            },
            builder: (context, state) {
              if (state.category == EChatItemType.product) {
                return _productList(state.myProducts);
              }
              return _togetherList(state.myTogethers);
            },
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
              child: Center(
                child: BlocBuilder<ProfileTabBloc, ProfileTabState>(
                  builder: (context, state) {
                    if (state.status == ELoadingStatus.error &&
                        state.myProductsStatus == ELoadingStatus.loading) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppFont(state.message ?? Strings.unknownFail),
                          Gaps.v20,
                          AppInkButton(
                            onTap: _loadData,
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
          ),
        ],
      ),
    );
  }

  Widget _productList(List<ProductPreviewModel> products) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size20,
      ),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: Sizes.size16,
          mainAxisSpacing: Sizes.size16,
        ),
        itemBuilder: (context, index) => ProductListItem(
          product: products[index],
        ),
        itemCount: products.length,
      ),
    );
  }

  Widget _togetherList(List<TogetherPreviewModel> togethers) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size20,
        vertical: Sizes.size10,
      ),
      sliver: SliverList.separated(
        itemBuilder: (context, index) => TogetherListItem(
          together: togethers[index],
        ),
        separatorBuilder: (context, index) => Gaps.v16,
        itemCount: togethers.length,
      ),
    );
  }
}
