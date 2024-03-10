import 'package:child_goods_store_flutter/blocs/auth/auth_bloc.dart';
import 'package:child_goods_store_flutter/blocs/auth/auth_bloc_singleton.dart';
import 'package:child_goods_store_flutter/blocs/auth/auth_state.dart';
import 'package:child_goods_store_flutter/blocs/profile/profile_bloc.dart';
import 'package:child_goods_store_flutter/blocs/profile/profile_event.dart';
import 'package:child_goods_store_flutter/blocs/profile/profile_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/routes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/pages/profile/widgets/profile_card.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  final bool popAble;

  const ProfilePage({
    super.key,
    required this.popAble,
  });

  void _onTapRetryGetProfile(BuildContext context) {
    context.read<ProfileBloc>().add(ProfileGet());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileBloc, ProfileState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == ELoadingStatus.error &&
                state.profileStatus == ELoadingStatus.loaded) {
              AppSnackbar.show(
                context,
                message: state.message ?? Strings.unknownFail,
              );
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          bloc: AuthBlocSingleton.bloc,
          listenWhen: (previous, current) => previous.user != current.user,
          listener: (context, state) {
            context.read<ProfileBloc>().add(ProfileGet());
          },
        )
      ],
      child: Scaffold(
        appBar: popAble
            ? AppBar(
                title: const AppFont('프로필'),
              )
            : null,
        body: SafeArea(
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state.profileStatus == ELoadingStatus.loaded) {
                return _buildBody(context, state: state);
              }
              if (state.status == ELoadingStatus.error &&
                  state.profileStatus == ELoadingStatus.loading) {
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
    required ProfileState state,
  }) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ProfileCard(
            userProfile: state.userProfile!,
            popAble: popAble,
          ),
        ),
        SliverToBoxAdapter(
          child: AppInkButton(
            onTap: () {
              context.push('${Routes.profile}/10');
            },
            child: const AppFont('test open user profile'),
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
            onTap: () => _onTapRetryGetProfile(context),
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
