import 'package:child_goods_store_flutter/GA/models/ga_event_interface.dart';
import 'package:child_goods_store_flutter/flavors.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class GoogleAnalytics {
  static final GoogleAnalytics _instance = GoogleAnalytics._();
  static GoogleAnalytics get instance => _instance;

  late final FirebaseAnalytics _firebaseAnalytics;
  FirebaseAnalytics get firebaseInstance => _firebaseAnalytics;

  GoogleAnalytics._() {
    _firebaseAnalytics = FirebaseAnalytics.instance;
  }

  bool _isSupported = false;

  Future<void> initialize() async {
    await _firebaseAnalytics.setAnalyticsCollectionEnabled(true);
    _isSupported = await _firebaseAnalytics.isSupported();
    // Do not support GA on dev build
    _isSupported = F.appFlavor == Flavor.dev ? false : _isSupported;
  }

  Future<void> event(GAEvents event) async {
    if (_isSupported) {
      await _firebaseAnalytics.logEvent(
        name: event.type,
        parameters: event.toJson(),
      );
      debugPrint('[GA] [${event.type}]: ${event.toJson()}');
    }
  }
}
