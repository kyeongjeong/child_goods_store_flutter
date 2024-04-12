import 'package:child_goods_store_flutter/blocs/together/detail/together_detail_bloc.dart';
import 'package:child_goods_store_flutter/blocs/together/detail/together_detail_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/utils/other_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TogetherDetailPriceWidget extends StatelessWidget {
  const TogetherDetailPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AppFont(
          '가격 (원)',
          fontSize: Sizes.size16,
          fontWeight: FontWeight.w700,
        ),
        Gaps.v5,
        BlocBuilder<TogetherDetailBloc, TogetherDetailState>(
          builder: (context, state) => Column(
            children: [
              _container(
                context,
                title: '총 가격',
                price: state.together?.totalPrice,
              ),
              Gaps.v5,
              _container(
                context,
                title: '목표 단가',
                price: state.together?.purchasePrice,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _container(
    BuildContext context, {
    required String title,
    int? price,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.circular(Sizes.size20),
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: Sizes.size80,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.only(
              right: Sizes.size5,
              bottom: Sizes.size2,
              top: Sizes.size2,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: AppFont(
                title,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
              child: Row(
                children: [
                  Expanded(
                    child: AppFont(
                      price?.price() ?? '-',
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.right,
                      maxLine: 1,
                    ),
                  ),
                  const AppFont(
                    '원',
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
