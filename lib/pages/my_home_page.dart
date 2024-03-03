import 'package:child_goods_store_flutter/configs/configs.dart';
import 'package:flutter/material.dart';
import '../flavors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      body: Center(
        child: Text(
          'Hello ${Config.instance.baseUrl}',
          style: const TextStyle(color: Colors.green),
        ),
      ),
    );
  }
}