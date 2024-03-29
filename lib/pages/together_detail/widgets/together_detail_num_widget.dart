import 'package:child_goods_store_flutter/blocs/together/detail/together_detail_bloc.dart';
import 'package:child_goods_store_flutter/blocs/together/detail/together_detail_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/utils/other_extensions.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TogetherDetailNumWidget extends StatelessWidget {
  const TogetherDetailNumWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AppFont(
          '참여 현황',
          fontSize: Sizes.size16,
          fontWeight: FontWeight.w700,
        ),
        Gaps.v5,
        BlocBuilder<TogetherDetailBloc, TogetherDetailState>(
          builder: (context, state) => Column(
            children: [
              LinearPercentIndicator(
                padding: EdgeInsets.zero,
                percent: (state.together?.purchaseNum ?? 0) /
                    (state.together?.totalNum ?? 1),
                barRadius: const Radius.circular(Sizes.size5),
                lineHeight: Sizes.size16,
                progressColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.black.withOpacity(0.1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppFont(
                      '현재 모집 수량: ${state.together?.purchaseNum?.price() ?? 0}'),
                  AppFont('전체 수량: ${state.together?.totalNum?.price() ?? 0}'),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const AppFont('잔여: '),
                  AppFont(
                    ((state.together?.totalNum ?? 0) -
                            (state.together?.purchaseNum ?? 0))
                        .price(),
                    fontWeight: FontWeight.w700,
                    fontSize: Sizes.size16,
                  ),
                  const AppFont('개'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
