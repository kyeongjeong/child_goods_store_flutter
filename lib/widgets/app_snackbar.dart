import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:flutter/material.dart';

class AppSnackbar extends SnackBar {
  AppSnackbar(
    BuildContext context, {
    super.key,
    required super.content,
  }) : super(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.6),
          elevation: 0,
        );

  static show(
    BuildContext context, {
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      AppSnackbar(
        context,
        content: AppFont(message),
      ),
    );
  }
}
