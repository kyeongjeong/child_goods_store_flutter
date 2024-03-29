import 'package:child_goods_store_flutter/blocs/together/detail/together_detail_bloc.dart';
import 'package:child_goods_store_flutter/blocs/together/detail/together_detail_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
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
          builder: (context, state) => Row(
            children: [
              Flexible(
                child: _container(
                  context,
                  title: '총 가격',
                  value: state.together?.totalPrice?.price() ?? Strings.nullStr,
                ),
              ),
              Gaps.h10,
              Flexible(
                child: _container(
                  context,
                  title: '목표 단가',
                  value:
                      state.together?.purchasePrice?.price() ?? Strings.nullStr,
                ),
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
    required String value,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.circular(Sizes.size10),
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size3,
              horizontal: Sizes.size10,
            ),
            child: AppFont(
              title,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
              child: Align(
                alignment: Alignment.centerRight,
                child: AppFont(
                  value,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
