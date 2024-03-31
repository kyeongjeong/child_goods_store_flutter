import 'package:carousel_slider/carousel_slider.dart';
import 'package:child_goods_store_flutter/blocs/product/detail/product_detail_bloc.dart';
import 'package:child_goods_store_flutter/blocs/product/detail/product_detail_event.dart';
import 'package:child_goods_store_flutter/blocs/product/detail/product_detail_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/enums/product_state.dart';
import 'package:child_goods_store_flutter/models/user/user_profile_model.dart';
import 'package:child_goods_store_flutter/pages/product_detail/widgets/product_detail_bottom_bar.dart';
import 'package:child_goods_store_flutter/pages/product_detail/widgets/product_detail_heart_widget.dart';
import 'package:child_goods_store_flutter/pages/product_detail/widgets/product_detail_status_widget.dart';
import 'package:child_goods_store_flutter/pages/product_detail/widgets/product_detail_tag_widget.dart';
import 'package:child_goods_store_flutter/pages/product_detail/widgets/product_detail_profile_widget.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  void _onTapRetryGetProductDetail(BuildContext context) {
    context.read<ProductDetailBloc>().add(ProductDetailGet());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductDetailBloc, ProductDetailState>(
      listener: (context, state) {
        if (state.status == ELoadingStatus.error &&
            state.productStatus != ELoadingStatus.loading) {
          AppSnackbar.show(
            context,
            message: state.message ?? Strings.unknownFail,
          );
        }
        if (state.status == ELoadingStatus.loaded &&
            state.changeSaleStatus == ELoadingStatus.loaded) {
          AppSnackbar.show(
            context,
            message: '${state.productModel?.state?.text} 상태로 변경되었습니다!',
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const AppFont('상품 상세'),
          actions: const [
            ProductDetailHeartWidget(),
          ],
        ),
        body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
            if (state.productStatus == ELoadingStatus.loaded) {
              return _buildBody(context, state: state);
            }
            if (state.status == ELoadingStatus.error &&
                state.productStatus == ELoadingStatus.loading) {
              return _buildError(
                context,
                message: state.message ?? Strings.unknownFail,
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        bottomNavigationBar: const ProductDetailBottomBar(),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context, {
    required ProductDetailState state,
  }) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (state.productModel?.productImage.isNotEmpty == true)
            CarouselSlider(
              items: [
                for (var image in state.productModel?.productImage ?? [])
                  Image.network(image),
              ],
              options: CarouselOptions(
                height: 200,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),
          Gaps.v10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDetailProfileWidget(
                  profile: state.productModel?.user ?? UserProfileModel(),
                ),
                Gaps.v20,
                AppFont(
                  state.productModel?.productName ?? Strings.nullStr,
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w700,
                ),
                Gaps.v5,
                AppFont(state.productModel?.content ?? Strings.nullStr),
                Gaps.v10,
                ProductDetailStatusWidget(
                  productState: state.productModel?.productState ??
                      EProductState.manyUsage,
                ),
              ],
            ),
          ),
          Gaps.v10,
          ProductDetailTagWidget(tags: state.productModel?.tag ?? []),
          Gaps.v20,
        ],
      ),
    );
  }

  Widget _buildError(
    BuildContext context, {
    required String message,
  }) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppFont(message),
          Gaps.v20,
          AppInkButton(
            onTap: () => _onTapRetryGetProductDetail(context),
            child: const AppFont(
              '재시도',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
