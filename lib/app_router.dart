import 'package:child_goods_store_flutter/blocs/auth/auth_bloc_singleton.dart';
import 'package:child_goods_store_flutter/blocs/phone_verify/phone_verify_bloc.dart';
import 'package:child_goods_store_flutter/blocs/signup/signup_bloc.dart';
import 'package:child_goods_store_flutter/blocs/splash/splash_cubit.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/enums/auth_status.dart';
import 'package:child_goods_store_flutter/flavors.dart';
import 'package:child_goods_store_flutter/pages/my_home_page.dart';
import 'package:child_goods_store_flutter/pages/phone_verify/phone_verify_page.dart';
import 'package:child_goods_store_flutter/pages/signin/signin_page.dart';
import 'package:child_goods_store_flutter/pages/signup/signup_page.dart';
import 'package:child_goods_store_flutter/pages/splash/splash_page.dart';
import 'package:child_goods_store_flutter/repositories/auth_repository.dart';
import 'package:child_goods_store_flutter/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

class AppRouter extends StatefulWidget {
  const AppRouter({super.key});

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  late GoRouter _routerConfig;

  @override
  void initState() {
    super.initState();

    // Initialize AuthBlocSingleton
    AuthBlocSingleton.initializer(
      authRepository: context.read<AuthRepository>(),
      userRepository: context.read<UserRepository>(),
    );

    // Setting router configs
    _routerConfig = GoRouter(
      initialLocation: '/',
      refreshListenable: AuthBlocSingleton.bloc,
      redirect: (context, state) {
        final authState = AuthBlocSingleton.bloc.state;
        final blockPageInAuthAuthState = ['/', '/signin'];
        final allowPageInUnknownState = ['/signup', '/phone_verify'];

        if (authState.authStatus == EAuthStatus.init) {
          return '/';
        }
        if (authState.authStatus == EAuthStatus.unknown) {
          return allowPageInUnknownState.contains(state.matchedLocation)
              ? state.matchedLocation
              : '/signin';
        }
        if (authState.authStatus == EAuthStatus.unAuthenticated) {
          return '/edit/profile';
        }
        if (authState.authStatus == EAuthStatus.authenticated) {
          return blockPageInAuthAuthState.contains(state.matchedLocation)
              ? '/home'
              : state.matchedLocation;
        }
        return state.matchedLocation;
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => BlocProvider(
            create: (context) => SplashCubit(),
            child: const SplashPage(),
          ),
        ),
        GoRoute(
          path: '/signin',
          builder: (context, state) => const SigninPage(),
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) => BlocProvider(
            create: (context) => SignupBloc(
              authRepository: context.read<AuthRepository>(),
            ),
            child: const SignupPage(),
          ),
        ),
        GoRoute(
          path: '/phone_verify',
          builder: (context, state) => BlocProvider(
            create: (context) => PhoneVerifyBloc(
              authRepository: context.read<AuthRepository>(),
            ),
            child: const PhoneVerifyPage(),
          ),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const MyHomePage(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _routerConfig,
      debugShowCheckedModeBanner: false,
      title: F.title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        primaryColor: Colors.cyan.shade600,
        splashColor: Colors.cyan.shade700,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko'),
        Locale('en'),
      ],
      locale: const Locale('ko'),
      builder: (context, child) => _flavorBanner(
        child: child ?? const SizedBox(),
      ),
    );
  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
              location: BannerLocation.topStart,
              message: F.name,
              color: Colors.green.withOpacity(0.6),
              textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
                letterSpacing: 1.0,
              ),
              textDirection: TextDirection.ltr,
              child: child,
            )
          : Container(
              child: child,
            );
}
