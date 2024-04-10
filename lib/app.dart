import 'package:child_goods_store_flutter/app_router.dart';
import 'package:child_goods_store_flutter/blocs/app_data/app_data_bloc.dart';
import 'package:child_goods_store_flutter/repositories/auth_repository.dart';
import 'package:child_goods_store_flutter/repositories/child_repository.dart';
import 'package:child_goods_store_flutter/repositories/data_repository.dart';
import 'package:child_goods_store_flutter/repositories/image_repository.dart';
import 'package:child_goods_store_flutter/repositories/product_repository.dart';
import 'package:child_goods_store_flutter/repositories/profile_repository.dart';
import 'package:child_goods_store_flutter/repositories/search_repository.dart';
import 'package:child_goods_store_flutter/repositories/together_repository.dart';
import 'package:child_goods_store_flutter/repositories/user_repository.dart';
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
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider(
          create: (context) => ChildRepository(),
        ),
        RepositoryProvider(
          create: (context) => ProductRepository(),
        ),
        RepositoryProvider(
          create: (context) => TogetherRepository(),
        ),
        RepositoryProvider(
          create: (context) => ProfileRepository(),
        ),
        RepositoryProvider(
          create: (context) => ImageRepository(),
        ),
        RepositoryProvider(
          create: (context) => SearchRepository(),
        ),
        RepositoryProvider(
          create: (context) => DataRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppDataBloc(
              dataRepository: context.read<DataRepository>(),
            ),
          ),
        ],
        child: const AppRouter(),
      ),
    );
  }
}
