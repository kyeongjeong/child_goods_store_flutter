import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class PageTransition {
  static CustomTransitionPage cupertino({
    LocalKey? key,
    required Widget child,
  }) =>
      CustomTransitionPage(
        key: key,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return CupertinoPageTransition(
            primaryRouteAnimation: animation,
            secondaryRouteAnimation: secondaryAnimation,
            linearTransition: false,
            child: child,
          );
        },
        child: child,
      );
}
