import 'package:child_goods_store_flutter/blocs/auth/auth_bloc.dart';
import 'package:child_goods_store_flutter/blocs/auth/auth_bloc_singleton.dart';
import 'package:child_goods_store_flutter/blocs/auth/auth_event.dart';
import 'package:child_goods_store_flutter/blocs/auth/auth_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _emailController;
  late TextEditingController _pwController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _pwController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  void _onTapLogin() {
    AuthBlocSingleton.bloc.add(Auth3C1SSignin(
      email: _emailController.text,
      password: _pwController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          controller: _emailController,
          hintText: '이메일',
          keyboardType: TextInputType.emailAddress,
          hasNext: true,
        ),
        Gaps.v20,
        AppTextFormField(
          controller: _pwController,
          hintText: '비밀번호',
          obscureText: true,
          onFieldSubmitted: (_) => _onTapLogin(),
        ),
        Gaps.v20,
        BlocBuilder<AuthBloc, AuthState>(
          bloc: AuthBlocSingleton.bloc,
          builder: (context, state) => AppInkButton(
            onTap: state.status == ELoadingStatus.loading ? null : _onTapLogin,
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: state.status == ELoadingStatus.loading
                    ? const SizedBox(
                        width: Sizes.size20,
                        height: Sizes.size20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const AppFont(
                        '로그인',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
