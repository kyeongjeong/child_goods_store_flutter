import 'package:child_goods_store_flutter/blocs/auth/auth_bloc.dart';
import 'package:child_goods_store_flutter/blocs/auth/auth_bloc_singleton.dart';
import 'package:child_goods_store_flutter/blocs/auth/auth_event.dart';
import 'package:child_goods_store_flutter/blocs/auth/auth_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/routes.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/auth_method.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/pages/signin/widgets/login_form.dart';
import 'package:child_goods_store_flutter/pages/signin/widgets/oauth_button.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_h_spliter.dart';
import 'package:child_goods_store_flutter/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import 'package:go_router/go_router.dart';

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

  void _onTapSignup(BuildContext context) {
    context.push(Routes.signup);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: AuthBlocSingleton.bloc,
      listener: (context, state) {
        if (state.status == ELoadingStatus.error) {
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
              Expanded(
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade400,
                  radius: Sizes.size32,
                ),
              ),
              const LoginForm(),
              Gaps.v20,
              SizedBox(
                height:
                    math.max(0, 320 - MediaQuery.of(context).viewInsets.bottom),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Gaps.h5,
                          const AppFont('또는'),
                          GestureDetector(
                            onTap: () => _onTapSignup(context),
                            child: Padding(
                              padding: const EdgeInsets.all(Sizes.size5),
                              child: AppFont(
                                '회원가입',
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const AppHSpliter(
                        margin: EdgeInsets.all(Sizes.size20),
                      ),
                      const AppFont('간편 로그인'),
                      Gaps.v10,
                      OauthButton(
                        method: EAuthMethod.google,
                        onTap: _onTapGoogle,
                      ),
                      Gaps.v10,
                      OauthButton(
                        method: EAuthMethod.naver,
                        onTap: _onTapNaver,
                      ),
                      Gaps.v10,
                      OauthButton(
                        method: EAuthMethod.kakao,
                        onTap: _onTapKakao,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
