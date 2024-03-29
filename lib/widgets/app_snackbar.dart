import 'dart:ui';

import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:flutter/material.dart';

class AppSnackbar extends SnackBar {
  const AppSnackbar(
    BuildContext context, {
    super.key,
    required super.content,
  }) : super(
          backgroundColor: Colors.transparent,
          elevation: 0,
          padding: EdgeInsets.zero,
        );

  static show(
    BuildContext context, {
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      AppSnackbar(
        context,
        content: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: Sizes.size5,
              sigmaY: Sizes.size5,
            ),
            child: Container(
              padding: const EdgeInsets.all(Sizes.size20),
              color: Theme.of(context).primaryColor.withOpacity(0.6),
              child: AppFont(message),
            ),
          ),
        ),
      ),
    );
  }
}
