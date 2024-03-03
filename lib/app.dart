import 'package:child_goods_store_flutter/app_router.dart';
import 'package:child_goods_store_flutter/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
      ],
      child: const AppRouter(),
    );
  }
}
