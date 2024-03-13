import 'package:child_goods_store_flutter/blocs/auth/auth_bloc_singleton.dart';
import 'package:child_goods_store_flutter/blocs/child/child_bloc.dart';
import 'package:child_goods_store_flutter/blocs/edit_address/edit_address_bloc.dart';
import 'package:child_goods_store_flutter/blocs/edit_child/edit_child_bloc.dart';
import 'package:child_goods_store_flutter/blocs/edit_profile/edit_profile_bloc.dart';
import 'package:child_goods_store_flutter/blocs/edit_tag/edit_tag_bloc.dart';
import 'package:child_goods_store_flutter/blocs/follow/follow_bloc.dart';
import 'package:child_goods_store_flutter/blocs/phone_verify/phone_verify_bloc.dart';
import 'package:child_goods_store_flutter/blocs/profile/profile_bloc.dart';
import 'package:child_goods_store_flutter/blocs/signup/signup_bloc.dart';
import 'package:child_goods_store_flutter/blocs/splash/splash_cubit.dart';
import 'package:child_goods_store_flutter/constants/routes.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/auth_status.dart';
import 'package:child_goods_store_flutter/enums/follow_mode.dart';
import 'package:child_goods_store_flutter/enums/http_method.dart';
import 'package:child_goods_store_flutter/flavors.dart';
import 'package:child_goods_store_flutter/models/address/address_model.dart';
import 'package:child_goods_store_flutter/models/child/child_model.dart';
import 'package:child_goods_store_flutter/models/go_router_extra_model.dart';
import 'package:child_goods_store_flutter/pages/chat/chat_page.dart';
import 'package:child_goods_store_flutter/pages/child/child_page.dart';
import 'package:child_goods_store_flutter/pages/edit_address/edit_address_page.dart';
import 'package:child_goods_store_flutter/pages/edit_child/edit_child_page.dart';
import 'package:child_goods_store_flutter/pages/edit_profile/edit_profile_page.dart';
import 'package:child_goods_store_flutter/pages/edit_tag/edit_tag_page.dart';
import 'package:child_goods_store_flutter/pages/follow/follow_page.dart';
import 'package:child_goods_store_flutter/pages/home/home_page.dart';
import 'package:child_goods_store_flutter/pages/notification/notification_page.dart';
import 'package:child_goods_store_flutter/pages/phone_verify/phone_verify_page.dart';
import 'package:child_goods_store_flutter/pages/profile/profile_page.dart';
import 'package:child_goods_store_flutter/pages/settings/settings_page.dart';
import 'package:child_goods_store_flutter/pages/ship/ship_page.dart';
import 'package:child_goods_store_flutter/pages/signin/signin_page.dart';
import 'package:child_goods_store_flutter/pages/signup/signup_page.dart';
import 'package:child_goods_store_flutter/pages/splash/splash_page.dart';
import 'package:child_goods_store_flutter/pages/together/together_page.dart';
import 'package:child_goods_store_flutter/repositories/auth_repository.dart';
import 'package:child_goods_store_flutter/repositories/child_repository.dart';
import 'package:child_goods_store_flutter/repositories/data_repository.dart';
import 'package:child_goods_store_flutter/repositories/image_repository.dart';
import 'package:child_goods_store_flutter/repositories/search_repository.dart';
import 'package:child_goods_store_flutter/repositories/user_repository.dart';
import 'package:child_goods_store_flutter/utils/google_analytics.dart';
import 'package:child_goods_store_flutter/utils/page_transition.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      initialLocation: Routes.root,
      refreshListenable: AuthBlocSingleton.bloc,
      observers: [
        FirebaseAnalyticsObserver(
          analytics: GoogleAnalytics.instance.firebaseInstance,
        ),
      ],
      redirect: (context, state) {
        final authState = AuthBlocSingleton.bloc.state;
        final allowPageInUnknownState = [Routes.signup, Routes.phoneVerify];
        final allowPageInUnAuthState = [Routes.phoneVerify];
        final blockPageInAuthState = [Routes.root, Routes.signin];

        if (authState.authStatus == EAuthStatus.init) {
          return Routes.root;
        }
        if (authState.authStatus == EAuthStatus.unknown) {
          return allowPageInUnknownState.contains(state.uri.toString())
              ? state.uri.toString()
              : Routes.signin;
        }
        if (authState.authStatus == EAuthStatus.unAuthenticated) {
          return allowPageInUnAuthState.contains(state.uri.toString())
              ? state.uri.toString()
              : Routes.editProfile;
        }
        if (authState.authStatus == EAuthStatus.authenticated) {
          return blockPageInAuthState.contains(state.uri.toString())
              ? Routes.home
              : state.uri.toString();
        }
        return state.uri.toString();
      },
      routes: [
        GoRoute(
          path: Routes.root,
          pageBuilder: (context, state) => PageTransition.cupertino(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => SplashCubit(),
              child: const SplashPage(),
            ),
          ),
        ),
        GoRoute(
          path: Routes.signin,
          pageBuilder: (context, state) => PageTransition.cupertino(
            key: state.pageKey,
            child: const SigninPage(),
          ),
        ),
        GoRoute(
          path: Routes.signup,
          pageBuilder: (context, state) => PageTransition.cupertino(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => SignupBloc(
                authRepository: context.read<AuthRepository>(),
              ),
              child: const SignupPage(),
            ),
          ),
        ),
        GoRoute(
          path: Routes.phoneVerify,
          pageBuilder: (context, state) => PageTransition.cupertino(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => PhoneVerifyBloc(
                authRepository: context.read<AuthRepository>(),
              ),
              child: const PhoneVerifyPage(),
            ),
          ),
        ),
        GoRoute(
          path: Routes.editProfile,
          pageBuilder: (context, state) => PageTransition.cupertino(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => EditProfileBloc(
                userRepository: context.read<UserRepository>(),
                imageRepository: context.read<ImageRepository>(),
                user: AuthBlocSingleton.bloc.state.user,
                httpMethod:
                    (AuthBlocSingleton.bloc.state.user?.nickName == null ||
                            AuthBlocSingleton.bloc.state.user?.nickName ==
                                Strings.nullStr)
                        ? EHttpMethod.post
                        : EHttpMethod.patch,
              ),
              child: const EditProfilePage(),
            ),
          ),
        ),
        GoRoute(
          path: Routes.editTag,
          pageBuilder: (context, state) => PageTransition.cupertino(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => EditTagBloc(
                searchRepository: context.read<SearchRepository>(),
                tags: (state.extra as GoRouterExtraModel<List<String>>?)?.data,
              ),
              child: const EditTagPage(),
            ),
          ),
        ),
        GoRoute(
          path: Routes.editAddress,
          pageBuilder: (context, state) => PageTransition.cupertino(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => EditAddressBloc(
                dataRepository: context.read<DataRepository>(),
                httpMethod:
                    (state.extra as GoRouterExtraModel<AddressModel>?)?.data ==
                            null
                        ? EHttpMethod.post
                        : EHttpMethod.patch,
                address:
                    (state.extra as GoRouterExtraModel<AddressModel>?)?.data,
              ),
              child: const EditAddressPage(),
            ),
          ),
        ),
        StatefulShellRoute.indexedStack(
          pageBuilder: (context, state, navigationShell) =>
              PageTransition.cupertino(
            key: state.pageKey,
            child: Scaffold(
              body: navigationShell,
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                useLegacyColorScheme: true,
                unselectedLabelStyle: const TextStyle(fontSize: Sizes.size10),
                selectedLabelStyle: const TextStyle(fontSize: Sizes.size12),
                selectedIconTheme: const IconThemeData(size: Sizes.size28),
                items: [
                  const BottomNavigationBarItem(
                    label: '중고거래',
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    label: '공동구매',
                    icon: Transform.scale(
                      scale: 0.8,
                      child: const Icon(FontAwesomeIcons.boxesStacked),
                    ),
                  ),
                  const BottomNavigationBarItem(
                    label: '자녀',
                    icon: Icon(Icons.child_care_rounded),
                  ),
                  const BottomNavigationBarItem(
                    label: '채팅',
                    icon: Icon(Icons.chat_rounded),
                  ),
                  const BottomNavigationBarItem(
                    label: '내 정보',
                    icon: Icon(Icons.person_rounded),
                  ),
                ],
                currentIndex: navigationShell.currentIndex,
                onTap: (value) => navigationShell.goBranch(value),
              ),
            ),
          ),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: Routes.home,
                  builder: (context, state) => const HomePage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: Routes.together,
                  builder: (context, state) => const TogetherPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: Routes.child,
                  builder: (context, state) => BlocProvider(
                    create: (context) => ChildBloc(
                      childRepository: context.read<ChildRepository>(),
                    ),
                    child: const ChildPage(),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: Routes.chat,
                  builder: (context, state) => const ChatPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: Routes.profile,
                  builder: (context, state) => BlocProvider(
                    create: (context) => ProfileBloc(
                      userRepository: context.read<UserRepository>(),
                      userIdx: AuthBlocSingleton.bloc.state.user!.userIdx!,
                    ),
                    child: const ProfilePage(
                      popAble: false,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '${Routes.profile}/:userIdx',
          pageBuilder: (context, state) => PageTransition.cupertino(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => ProfileBloc(
                userRepository: context.read<UserRepository>(),
                userIdx: int.parse(state.pathParameters['userIdx'] as String),
              ),
              child: const ProfilePage(popAble: true),
            ),
          ),
        ),
        GoRoute(
          path: '${Routes.follow}/:userIdx',
          pageBuilder: (context, state) => PageTransition.cupertino(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => FollowBloc(
                userRepository: context.read<UserRepository>(),
                userIdx: int.parse(state.pathParameters['userIdx'] as String),
                mode: strToEFollowMode(state.uri.queryParameters['mode'])!,
              ),
              child: FollowPage(
                mode: strToEFollowMode(state.uri.queryParameters['mode'])!,
              ),
            ),
          ),
        ),
        GoRoute(
          path: Routes.editChild,
          pageBuilder: (context, state) => PageTransition.cupertino(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => EditChildBloc(
                childRepository: context.read<ChildRepository>(),
                imageRepository: context.read<ImageRepository>(),
                httpMethod:
                    (state.extra as GoRouterExtraModel<ChildModel>?)?.data ==
                            null
                        ? EHttpMethod.post
                        : EHttpMethod.patch,
                child: (state.extra as GoRouterExtraModel<ChildModel>?)?.data,
              ),
              child: const EditChildPage(),
            ),
          ),
        ),
        GoRoute(
          path: Routes.settings,
          pageBuilder: (context, state) => PageTransition.cupertino(
            key: state.pageKey,
            child: const SettingsPage(),
          ),
          routes: [
            GoRoute(
              path: SubRoutes.ship,
              pageBuilder: (context, state) => PageTransition.cupertino(
                key: state.pageKey,
                child: const ShipPage(),
              ),
            ),
            GoRoute(
              path: SubRoutes.notification,
              pageBuilder: (context, state) => PageTransition.cupertino(
                key: state.pageKey,
                child: const NotificationPage(),
              ),
            ),
          ],
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
        splashColor: Colors.black.withOpacity(0.1),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
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
