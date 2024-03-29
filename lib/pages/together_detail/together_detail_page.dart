import 'package:carousel_slider/carousel_slider.dart';
import 'package:child_goods_store_flutter/blocs/together/detail/together_detail_bloc.dart';
import 'package:child_goods_store_flutter/blocs/together/detail/together_detail_event.dart';
import 'package:child_goods_store_flutter/blocs/together/detail/together_detail_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/user/user_profile_model.dart';
import 'package:child_goods_store_flutter/pages/together_detail/widgets/together_detail_bottom_bar.dart';
import 'package:child_goods_store_flutter/pages/together_detail/widgets/together_detail_heart_widget.dart';
import 'package:child_goods_store_flutter/pages/together_detail/widgets/together_detail_num_widget.dart';
import 'package:child_goods_store_flutter/pages/together_detail/widgets/together_detail_price_widget.dart';
import 'package:child_goods_store_flutter/pages/together_detail/widgets/together_detail_profile_widget.dart';
import 'package:child_goods_store_flutter/pages/together_detail/widgets/together_detail_tag_widget.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TogetherDetailPage extends StatelessWidget {
  const TogetherDetailPage({super.key});

  void _onTapRetryGetTogetherDetail(BuildContext context) {
    context.read<TogetherDetailBloc>().add(TogetherDetailGet());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TogetherDetailBloc, TogetherDetailState>(
      listener: (context, state) {
        if (state.status == ELoadingStatus.error &&
            state.togetherStatus != ELoadingStatus.loading) {
          AppSnackbar.show(
            context,
            message: state.message ?? Strings.unknownFail,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const AppFont('공동구매 상세'),
          actions: const [
            TogetherDetailHeartWidget(),
          ],
        ),
        body: BlocBuilder<TogetherDetailBloc, TogetherDetailState>(
          builder: (context, state) {
            if (state.togetherStatus == ELoadingStatus.loaded) {
              return _buildBody(context, state: state);
            }
            if (state.status == ELoadingStatus.error &&
                state.togetherStatus == ELoadingStatus.loading) {
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
      ),
    );
  }

  Widget _buildBody(
    BuildContext context, {
    required TogetherDetailState state,
  }) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.together?.togetherImage.isNotEmpty == true)
                  CarouselSlider(
                    items: [
                      for (var image in state.together?.togetherImage ?? [])
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
                      TogetherDetailProfileWidget(
                        profile: state.together?.user ?? UserProfileModel(),
                      ),
                      Gaps.v20,
                      AppFont(
                        state.together?.togetherName ?? Strings.nullStr,
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w700,
                      ),
                      Gaps.v5,
                      AppFont(state.together?.details ?? Strings.nullStr),
                      Gaps.v20,
                      const AppFont(
                        '판매 링크',
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w700,
                      ),
                      Gaps.v5,
                      AppFont(state.together?.link ?? Strings.nullStr),
                      Gaps.v20,
                      const AppFont(
                        '거래 희망장소',
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w700,
                      ),
                      Gaps.v5,
                      AppFont(state.together?.address ?? Strings.nullStr),
                      Gaps.v5,
                      AppFont(state.together?.detailAddress ?? Strings.nullStr),
                      Gaps.v20,
                      const TogetherDetailNumWidget(),
                      Gaps.v20,
                      const AppFont(
                        '마감 기한',
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w700,
                      ),
                      Gaps.v5,
                      AppFont(state.together?.deadline
                              .toString()
                              .split(' ')
                              .first ??
                          Strings.nullStr),
                      Gaps.v20,
                      const TogetherDetailPriceWidget(),
                    ],
                  ),
                ),
                Gaps.v20,
                TogetherDetailTagWidget(tags: state.together?.tag ?? []),
                Gaps.v40,
              ],
            ),
          ),
        ),
        const TogetherDetailBottomBar(),
      ],
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
            onTap: () => _onTapRetryGetTogetherDetail(context),
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
