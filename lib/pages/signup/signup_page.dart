import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late TextEditingController _emailController;
  late TextEditingController _pwController;
  late TextEditingController _pwCheckController;
  final ValueNotifier<String> _phoneValue = ValueNotifier(Strings.nullStr);

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _pwController = TextEditingController();
    _pwCheckController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    _pwCheckController.dispose();
    super.dispose();
  }

  void _onTapPhone(BuildContext context) async {
    _phoneValue.value =
        await context.push<String?>('/phone_verify') ?? _phoneValue.value;
  }

  void _onTapSignup() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controller: _emailController,
                hintText: '이메일을 입력해주세요',
                keyboardType: TextInputType.emailAddress,
                hasNext: true,
              ),
              Gaps.v20,
              AppTextFormField(
                controller: _pwController,
                hintText: '비밀번호를 입력해주세요',
                obscureText: true,
                hasNext: true,
              ),
              Gaps.v20,
              AppTextFormField(
                controller: _pwCheckController,
                hintText: '비밀번호를 다시 입력해주세요',
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
                      child: ValueListenableBuilder(
                        valueListenable: _phoneValue,
                        builder: (context, value, child) => AppFont(
                          value == Strings.nullStr ? '번호를 변경해주세요.' : value,
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ),
                    AppInkButton(
                      onTap: () => _onTapPhone(context),
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
      bottomNavigationBar: AppInkButton(
        onTap: _onTapSignup,
        borderRadSize: 0,
        child: const SizedBox(
          width: double.infinity,
          height: Sizes.size32,
          child: Center(
            child: AppFont(
              '회원가입',
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
