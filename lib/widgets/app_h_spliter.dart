import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppHSpliter extends StatelessWidget {
  final EdgeInsets? margin;

  const AppHSpliter({
    super.key,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Sizes.size1,
      margin: margin,
      color: Theme.of(context).dividerColor,
    );
  }
}
