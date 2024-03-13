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

  Future<void> initialize({
    required int userId,
  }) async {
    await _firebaseAnalytics.setAnalyticsCollectionEnabled(true);
    _isSupported = await _firebaseAnalytics.isSupported();
    await _setUser(userId);
  }

  Future<void> _setUser(int userId) async {
    if (_isSupported) {
      await _firebaseAnalytics.setUserId(id: userId.toString());
      debugPrint('[GA] Set user: $userId');
    }
  }

  Future<void> login(EAuthMethod method) async {
    if (_isSupported) {
      await _firebaseAnalytics.logLogin(loginMethod: method.key);
      debugPrint('[GA] Login: Method - ${method.ko}');
    }
  }

  Future<void> autoLogin(UserModel user) async {
    if (_isSupported) {
      await _firebaseAnalytics.logLogin(
        parameters: user.toJson(),
      );
      debugPrint('[GA] Auto login: User - ${user.nickName}(${user.userIdx})');
    }
  }
}
