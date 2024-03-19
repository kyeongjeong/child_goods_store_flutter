import 'package:child_goods_store_flutter/constants/routes.dart';
import 'package:child_goods_store_flutter/flavors.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _pushProduct(
    BuildContext context, {
    required int productId,
  }) {
    context.push('${Routes.productDetail}/$productId');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppFont(F.title),
      ),
      body: Center(
        child: AppInkButton(
          onTap: () => _pushProduct(
            context,
            productId: 10,
          ),
          child: const AppFont('push product 10'),
        ),
      ),
    );
  }
}
