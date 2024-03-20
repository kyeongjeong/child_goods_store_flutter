import 'package:child_goods_store_flutter/blocs/auth/auth_bloc_singleton.dart';
import 'package:child_goods_store_flutter/blocs/product/buyer/product_buyer_bloc.dart';
import 'package:child_goods_store_flutter/blocs/product/detail/product_detail_bloc.dart';
import 'package:child_goods_store_flutter/blocs/product/detail/product_detail_event.dart';
import 'package:child_goods_store_flutter/blocs/product/detail/product_detail_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/enums/product_sale_status.dart';
import 'package:child_goods_store_flutter/pages/product_detail/widgets/product_detail_buyer_list.dart';
import 'package:child_goods_store_flutter/repositories/product_repository.dart';
import 'package:child_goods_store_flutter/widgets/app_bottom_sheet.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:child_goods_store_flutter/utils/other_extensions.dart';

class ProductDetailBottomBar extends StatelessWidget {
  const ProductDetailBottomBar({super.key});

  void _onTapChangeStatus(BuildContext context) {
    AppBottomSheet.show(
      context,
      child: Material(
        child: Column(
          children: [
            for (var status in EProductSaleStatus.values)
              AppInkButton(
                color: Colors.transparent,
                shadowColor: Colors.transparent,
                onTap: () => _onTapChangeStatusItem(
                  context,
                  status: status,
                  bloc: context.read<ProductBuyerBloc>(),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: AppFont(
                      status.text,
                      color: status ==
                              context
                                  .read<ProductDetailBloc>()
                                  .state
                                  .productModel
                                  ?.state
                          ? Theme.of(context).primaryColor
                          : null,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _onTapChangeStatusItem(
    BuildContext context, {
    required EProductSaleStatus status,
    required ProductBuyerBloc bloc,
  }) {
    if (status != EProductSaleStatus.soldout) {
      context
          .read<ProductDetailBloc>()
          .add(ProductDetailChangeSaleStatus(status));
      context.pop();
    } else {
      context.pop();
      AppBottomSheet.showList(
        context,
        builder: (_, controller) => ProductDetailBuyerList(
          controller: controller,
          bloc: bloc,
          onSelectBuyer: (userId) => _onSelectBuyer(
            context,
            userId: userId,
          ),
        ),
      );
    }
  }

  void _onSelectBuyer(
    BuildContext context, {
    required int userId,
  }) {
    context.read<ProductDetailBloc>().add(ProductDetailChangeSaleStatus(
          EProductSaleStatus.soldout,
          userId: userId,
        ));
    context.pop();
  }

  void _onTapEditProduct() {}

  void _onTapChat() {}

  bool _iamSaler(ProductDetailState state) {
    return AuthBlocSingleton.bloc.state.user?.userId ==
        state.productModel?.user?.userId;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBuyerBloc(
        productRepository: context.read<ProductRepository>(),
        productId:
            context.read<ProductDetailBloc>().state.productModel!.productId!,
      ),
      child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state.productStatus != ELoadingStatus.loaded) {
            return const SizedBox();
          }
          return Container(
            height: Sizes.size52 + MediaQuery.paddingOf(context).bottom,
            padding: EdgeInsets.only(
              bottom: MediaQuery.paddingOf(context).bottom,
              left: Sizes.size20,
              right: Sizes.size20,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: const [
                BoxShadow(
                  spreadRadius: Sizes.size1,
                  blurRadius: Sizes.size5,
                  offset: Offset(0, Sizes.size2),
                ),
              ],
            ),
            child: Material(
              child: Row(
                children: [
                  Expanded(
                    child: AppFont(
                      '${state.productModel?.price?.price()} 원',
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.h10,
                  if (_iamSaler(state))
                    AppInkButton(
                      onTap: state.changeSaleStatus == ELoadingStatus.loading
                          ? null
                          : () => _onTapChangeStatus(context),
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size10,
                        horizontal: Sizes.size14,
                      ),
                      child: SizedBox(
                        height: Sizes.size20,
                        child: Center(
                          child:
                              state.changeSaleStatus == ELoadingStatus.loading
                                  ? const SizedBox(
                                      width: Sizes.size16,
                                      height: Sizes.size16,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const AppFont(
                                      '상태 변경',
                                      color: Colors.white,
                                    ),
                        ),
                      ),
                    ),
                  if (!_iamSaler(state))
                    Padding(
                      padding: const EdgeInsets.only(right: Sizes.size20),
                      child: AppFont(
                        state.productModel?.state?.text ?? Strings.nullStr,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  Gaps.h10,
                  AppInkButton(
                    onTap: _iamSaler(state) ? _onTapEditProduct : _onTapChat,
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size10,
                      horizontal: Sizes.size14,
                    ),
                    child: AppFont(
                      _iamSaler(state) ? '수정하기' : '채팅하기',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
