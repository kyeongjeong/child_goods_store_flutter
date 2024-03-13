import 'package:child_goods_store_flutter/GA/models/ga_view_event.dart';
import 'package:child_goods_store_flutter/enums/auth_method.dart';
import 'package:child_goods_store_flutter/models/user/user_model.dart';
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
  }

  Future<void> login(EAuthMethod method) async {
    if (_isSupported) {
      await _firebaseAnalytics.logLogin(loginMethod: method.key);
      debugPrint('[GA] Login: Method - ${method.ko}');
    }
  }

  Future<void> autoLogin(UserModel user) async {
    if (_isSupported && user.userIdx != null) {
      await _firebaseAnalytics.logLogin(
        parameters: {
          'userId': user.userIdx!,
          'eventAt': DateTime.now().toIso8601String(),
        },
      );
      debugPrint('[GA] Auto login: User - ${user.nickName}(${user.userIdx})');
    }
  }

  Future<void> pushPage(GAViewEvent event) async {
    if (_isSupported) {
      await _firebaseAnalytics.logScreenView(
        screenName: event.page,
        parameters: event.toJson(),
      );
      debugPrint('[GA] [VIEW]: ${event.toJson()}');
    }
  }
}
