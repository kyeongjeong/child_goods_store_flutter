import 'package:child_goods_store_flutter/blocs/follow/follow_bloc.dart';
import 'package:child_goods_store_flutter/blocs/follow/follow_event.dart';
import 'package:child_goods_store_flutter/blocs/follow/follow_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/follow_mode.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/pages/follow/widgets/follow_user_card.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_h_spliter.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowPage extends StatelessWidget {
  final EFollowMode mode;

  const FollowPage({
    super.key,
    required this.mode,
  });

  void _onTapRetry(BuildContext context) {
    context.read<FollowBloc>().add(FollowGet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppFont(mode.text),
        centerTitle: false,
      ),
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<FollowBloc, FollowState>(
        builder: (context, state) {
          if (state.status == ELoadingStatus.loaded) {
            return _buildBody(context, state: state);
          }
          if (state.status == ELoadingStatus.error) {
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
    );
  }

  Widget _buildBody(
    BuildContext context, {
    required FollowState state,
  }) {
    return ListView.separated(
      itemBuilder: (context, index) => FollowUserCard(
        user: state.userList[index],
      ),
      separatorBuilder: (context, index) => const AppHSpliter(),
      itemCount: state.userList.length,
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
            onTap: () => _onTapRetry(context),
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
