/// HOW TO RUN APP with Flavor - dev mode
///
/// 1. type under commend
///   ```bash
///   flutter run --flavor dev -t lib/main_dev.dart
///   ```
/// 2. select device
/// 3. open dev tools and type commends (r - Hot reload)
///
///
/// HOW TO RUN APP with Flavor - prod mode
///
/// 1. type under commend
///   ```bash
///   flutter run --flavor prod -t lib/main_prod.dart
///   ```
/// 2. select device
/// 3. open dev tools and type commends (r - Hot reload)

import 'dart:async';
import 'package:child_goods_store_flutter/app.dart';
import 'package:child_goods_store_flutter/configs/firebase_options.dart';
import 'package:child_goods_store_flutter/GA/google_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

FutureOr<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await GoogleAnalytics.instance.initialize();

  runApp(const App());
}
