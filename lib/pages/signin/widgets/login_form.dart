import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

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
    print(_emailController.text);
    print(_pwController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          controller: _emailController,
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
          hasNext: true,
        ),
        Gaps.v20,
        AppTextFormField(
          controller: _pwController,
          hintText: 'Password',
          obscureText: true,
          onFieldSubmitted: (_) => _onTapLogin(),
        ),
        Gaps.v20,
        AppInkButton(
          onTap: _onTapLogin,
          color: Theme.of(context).primaryColorDark,
          child: const SizedBox(
            width: double.infinity,
            child: Center(
              child: AppFont(
                '로그인',
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
