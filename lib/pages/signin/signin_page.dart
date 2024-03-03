import 'package:child_goods_store_flutter/blocs/auth/auth_bloc.dart';
import 'package:child_goods_store_flutter/blocs/auth/auth_bloc_singleton.dart';
import 'package:child_goods_store_flutter/blocs/auth/auth_event.dart';
import 'package:child_goods_store_flutter/blocs/auth/auth_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/auth_method.dart';
import 'package:child_goods_store_flutter/enums/auth_status.dart';
import 'package:child_goods_store_flutter/pages/signin/widgets/oauth_button.dart';
import 'package:child_goods_store_flutter/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  void _onTapGoogle() {
    AuthBlocSingleton.bloc.add(AuthGoogleSignin());
  }

  void _onTapNaver() {
    AuthBlocSingleton.bloc.add(AuthNaverSignin());
  }

  void _onTapKakao() {
    AuthBlocSingleton.bloc.add(AuthKakaoSignin());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: AuthBlocSingleton.bloc,
      listener: (context, state) {
        if (state.status == EAuthStatus.error) {
          AppSnackbar.show(
            context,
            message: state.message ?? Strings.unknownFail,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          child: Column(
            children: [
              Gaps.v32,
              OauthButton(
                method: EAuthMethod.google,
                onTap: _onTapGoogle,
              ),
              Gaps.v5,
              OauthButton(
                method: EAuthMethod.naver,
                onTap: _onTapNaver,
              ),
              Gaps.v5,
              OauthButton(
                method: EAuthMethod.kakao,
                onTap: _onTapKakao,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
