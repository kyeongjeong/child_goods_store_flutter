import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PhoneVerifyPage extends StatefulWidget {
  const PhoneVerifyPage({super.key});

  @override
  State<PhoneVerifyPage> createState() => _PhoneVerifyPageState();
}

class _PhoneVerifyPageState extends State<PhoneVerifyPage> {
  late TextEditingController _phoneController;
  late TextEditingController _codeController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _codeController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  void _onTapComplete(BuildContext context) {
    context.pop<String>(_phoneController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppFont('핸드폰 인증'),
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
                controller: _phoneController,
                hintText: '핸드폰 번호를 입력해주세요',
                keyboardType: TextInputType.phone,
              ),
              Gaps.v20,
              AppTextFormField(
                controller: _codeController,
                hintText: '인증번호를 입력해주세요',
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppInkButton(
        onTap: () => _onTapComplete(context),
        borderRadSize: 0,
        child: const SizedBox(
          width: double.infinity,
          height: Sizes.size32,
          child: Center(
            child: AppFont(
              '인증 완료',
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
