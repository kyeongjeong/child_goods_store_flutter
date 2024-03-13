import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class PageTransition {
  static CustomTransitionPage cupertino({
    LocalKey? key,
    String? name,
    Object? arguments,
    required Widget child,
  }) =>
      CustomTransitionPage(
        key: key,
        name: name,
        arguments: arguments,
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
