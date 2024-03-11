import 'package:child_goods_store_flutter/flavors.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppFont(F.name),
      ),
      body: const Center(child: AppFont('/chat')),
    );
  }
}
