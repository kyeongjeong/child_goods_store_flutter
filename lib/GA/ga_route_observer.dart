import 'package:child_goods_store_flutter/GA/google_analytics.dart';
import 'package:child_goods_store_flutter/GA/models/ga_view_event.dart';
import 'package:flutter/material.dart';

class GARouteObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) async {
    super.didPush(route, previousRoute);

    if (route.settings.name == null) return;

    var viewEvent = GAViewEvent(
      page: route.settings.name!,
      id: (route.settings.arguments as Map<String, dynamic>?)?['id'] as int?,
    );

    await GoogleAnalytics.instance.event(viewEvent);
  }
}
