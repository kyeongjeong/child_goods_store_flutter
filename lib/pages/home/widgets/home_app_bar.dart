import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      child: Column(
        children: [
          AppFont('App bar'),
        ],
      ),
    );
  }
}
