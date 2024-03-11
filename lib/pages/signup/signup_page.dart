import 'package:child_goods_store_flutter/blocs/signup/signup_bloc.dart';
import 'package:child_goods_store_flutter/blocs/signup/signup_event.dart';
import 'package:child_goods_store_flutter/blocs/signup/signup_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/routes.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/app_snackbar.dart';
import 'package:child_goods_store_flutter/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  void _onChangeEmail(String value) {
    context.read<SignupBloc>().add(SignupChangeEmail(value));
  }

  void _onChangePW(String value) {
    context.read<SignupBloc>().add(SignupChangePW(value));
  }

  void _onChangePWCheck(String value) {
    context.read<SignupBloc>().add(SignupChangePWCheck(value));
  }

  void _onTapPhone() async {
    var phoneNum = await context.push<String?>(Routes.phoneVerify);
    if (phoneNum != null && mounted) {
      context.read<SignupBloc>().add(SignupChangePhoneNum(phoneNum));
    }
  }

  void _onTapSignup() {
    context.read<SignupBloc>().add(SignupSubmit());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state.status == ELoadingStatus.error) {
          AppSnackbar.show(
            context,
            message: state.message ?? Strings.nullStr,
          );
        }
        if (state.status == ELoadingStatus.loaded) {
          context.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const AppFont('회원가입'),
          centerTitle: false,
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppTextFormField(
                  hintText: '이메일을 입력해주세요',
                  keyboardType: TextInputType.emailAddress,
                  onChange: _onChangeEmail,
                  hasNext: true,
                ),
                Gaps.v20,
                AppTextFormField(
                  hintText: '비밀번호를 입력해주세요',
                  onChange: _onChangePW,
                  obscureText: true,
                  hasNext: true,
                ),
                Gaps.v20,
                AppTextFormField(
                  hintText: '비밀번호를 다시 입력해주세요',
                  onChange: _onChangePWCheck,
                  obscureText: true,
                ),
                Gaps.v32,
                const AppFont(
                  '핸드폰 인증',
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w700,
                ),
                Gaps.v10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
                  child: Row(
                    children: [
                      Expanded(
                        child: BlocBuilder<SignupBloc, SignupState>(
                          builder: (context, state) => AppFont(
                            state.phoneNum?.isNotEmpty == true
                                ? state.phoneNum!
                                : '번호를 변경해주세요.',
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ),
                      AppInkButton(
                        onTap: _onTapPhone,
                        child: const AppFont(
                          '번호 변경',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BlocBuilder<SignupBloc, SignupState>(
          builder: (context, state) {
            return AppInkButton(
              onTap:
                  state.status == ELoadingStatus.loading ? null : _onTapSignup,
              borderRadSize: 0,
              child: Container(
                width: double.infinity,
                height: Sizes.size32,
                margin: EdgeInsets.only(
                  bottom: MediaQuery.paddingOf(context).bottom,
                ),
                child: Center(
                  child: state.status == ELoadingStatus.loading
                      ? const SizedBox(
                          width: Sizes.size28,
                          height: Sizes.size28,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const AppFont(
                          '회원가입',
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
