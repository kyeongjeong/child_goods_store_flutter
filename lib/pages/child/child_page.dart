import 'package:child_goods_store_flutter/blocs/child/child_bloc.dart';
import 'package:child_goods_store_flutter/blocs/child/child_event.dart';
import 'package:child_goods_store_flutter/blocs/child/child_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/pages/child/widgets/child_list_card.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChildPage extends StatelessWidget {
  const ChildPage({super.key});

  void _onTapRetryGetChildren(BuildContext context) {
    context.read<ChildBloc>().add(ChildGetChildren());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChildBloc, ChildState>(
      listener: (context, state) {
        if (state.status == ELoadingStatus.error &&
            state.childListState == ELoadingStatus.loaded) {
          AppSnackbar.show(
            context,
            message: state.message ?? Strings.unknownFail,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const AppFont('자녀 맞춤추천'),
        ),
        body: SafeArea(
          child: BlocBuilder<ChildBloc, ChildState>(
            builder: (context, state) {
              if (state.childListState == ELoadingStatus.loaded) {
                return _buildBody(context, state: state);
              }
              if (state.status == ELoadingStatus.error &&
                  state.childListState == ELoadingStatus.loading) {
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
      ),
    );
  }

  Widget _buildBody(
    BuildContext context, {
    required ChildState state,
  }) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ChildListCard(
            children: state.childList,
            selectedChild: state.selectedChild,
          ),
        ),
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
            onTap: () => _onTapRetryGetChildren(context),
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
