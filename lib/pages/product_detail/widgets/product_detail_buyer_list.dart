import 'package:child_goods_store_flutter/blocs/product/buyer/product_buyer_bloc.dart';
import 'package:child_goods_store_flutter/blocs/product/buyer/product_buyer_event.dart';
import 'package:child_goods_store_flutter/blocs/product/buyer/product_buyer_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_h_spliter.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/app_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailBuyerList extends StatelessWidget {
  final ScrollController controller;
  final ProductBuyerBloc bloc;
  final Function(int userId) onSelectBuyer;

  const ProductDetailBuyerList({
    super.key,
    required this.controller,
    required this.bloc,
    required this.onSelectBuyer,
  });

  void _onTapRetry() {
    bloc.add(ProductBuyerGet());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBuyerBloc, ProductBuyerState>(
      bloc: bloc,
      builder: (context, state) {
        if (state.status == ELoadingStatus.loaded) {
          return ListView.separated(
            controller: controller,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
              vertical: 0,
            ),
            itemBuilder: (_, index) {
              return AppInkButton(
                onTap: () => onSelectBuyer(state.buyers![index].userId!),
                color: Theme.of(context).scaffoldBackgroundColor,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size5,
                  vertical: Sizes.size10,
                ),
                borderRadSize: 0,
                child: Row(
                  children: [
                    AppProfileImage(
                      profileImg: state.buyers![index].profileImg,
                      radius: Sizes.size32,
                    ),
                    Gaps.h10,
                    Expanded(
                      child: AppFont(
                        state.buyers![index].nickName ?? Strings.nullStr,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const AppHSpliter(),
            itemCount: state.buyers!.length,
          );
        } else if (state.status == ELoadingStatus.error) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppFont(state.message ?? Strings.unknownFail),
                Gaps.v20,
                AppInkButton(
                  onTap: _onTapRetry,
                  child: const AppFont(
                    '재시도',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
