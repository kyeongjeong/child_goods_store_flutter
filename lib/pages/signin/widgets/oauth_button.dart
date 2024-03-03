import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/enums/auth_method.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OauthButton extends StatelessWidget {
  final EAuthMethod method;
  final Function() onTap;

  const OauthButton({
    super.key,
    required this.method,
    required this.onTap,
  });

  ColorFilter? _colorFilter() {
    switch (method) {
      case EAuthMethod.google:
        return null;
      case EAuthMethod.kakao:
        return const ColorFilter.mode(
          Colors.black,
          BlendMode.srcIn,
        );
      case EAuthMethod.naver:
        return const ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        );
    }
  }

  Color _bgColor() {
    switch (method) {
      case EAuthMethod.google:
        return Colors.white;
      case EAuthMethod.kakao:
        return const Color(0xFFFEE500);
      case EAuthMethod.naver:
        return const Color(0xFF03C75A);
    }
  }

  Color _fontColor() {
    switch (method) {
      case EAuthMethod.google:
        return Colors.grey.shade800;
      case EAuthMethod.kakao:
        return const Color.fromRGBO(0, 0, 0, 0.85);
      case EAuthMethod.naver:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Theme.of(context).primaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(Sizes.size10),
      child: Ink(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
          horizontal: Sizes.size20,
        ),
        decoration: BoxDecoration(
          color: _bgColor(),
          borderRadius: BorderRadius.circular(Sizes.size10),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.1),
              blurRadius: Sizes.size3,
              spreadRadius: Sizes.size1,
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/svgs/${method.key.toLowerCase()}.svg',
              width: Sizes.size20,
              height: Sizes.size20,
              colorFilter: _colorFilter(),
              clipBehavior: Clip.hardEdge,
            ),
            Gaps.h10,
            AppFont(
              'Sign in with ${method.key}',
              color: _fontColor(),
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
