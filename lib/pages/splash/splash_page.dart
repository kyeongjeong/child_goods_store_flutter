import 'package:child_goods_store_flutter/blocs/app_data/app_data_bloc.dart';
import 'package:child_goods_store_flutter/blocs/app_data/app_data_event.dart';
import 'package:child_goods_store_flutter/blocs/app_data/app_data_state.dart';
import 'package:child_goods_store_flutter/blocs/auth/auth_bloc_singleton.dart';
import 'package:child_goods_store_flutter/blocs/auth/auth_event.dart';
import 'package:child_goods_store_flutter/blocs/splash/splash_cubit.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<AppDataBloc>().add(AppDataReset());
    WidgetsBinding.instance.addPostFrameCallback((_) => _afterFirstBuild());
  }

  void _afterFirstBuild() {
    context.read<SplashCubit>().setSplash(ESplash.adminDistrict);
  }

  void _getAdminDistrict() {
    context.read<AppDataBloc>().add(AppDataLoadAdminDistrict());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MultiBlocListener(
          listeners: [
            BlocListener<AppDataBloc, AppDataState>(
              listenWhen: (previous, current) =>
                  previous.region != current.region,
              listener: (context, state) {
                if (state.region != {}) {
                  context.read<SplashCubit>().setSplash(ESplash.getUser);
                }
              },
            ),
          ],
          child: BlocConsumer<SplashCubit, ESplash>(
            listener: (context, state) {
              if (state == ESplash.adminDistrict) {
                _getAdminDistrict();
              }
              if (state == ESplash.getUser) {
                AuthBlocSingleton.bloc.add(AuthGetUser());
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  Gaps.v10,
                  AppFont(state.text),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
