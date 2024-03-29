import 'package:child_goods_store_flutter/blocs/together/detail/together_detail_bloc.dart';
import 'package:child_goods_store_flutter/blocs/together/detail/together_detail_event.dart';
import 'package:child_goods_store_flutter/blocs/together/detail/together_detail_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TogetherDetailHeartWidget extends StatelessWidget {
  const TogetherDetailHeartWidget({super.key});

  void _onTapHeart(BuildContext context) {
    context.read<TogetherDetailBloc>().add(TogetherDetailChangeHeart());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TogetherDetailBloc, TogetherDetailState>(
      builder: (context, state) {
        if (state.togetherStatus != ELoadingStatus.loaded) {
          return Container();
        }
        return IconButton(
          onPressed: () => _onTapHeart(context),
          icon: Icon(
            state.together?.togetherHeart == true
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
          ),
        );
      },
    );
  }
}
