import 'package:child_goods_store_flutter/constants/networks.dart';
import 'package:child_goods_store_flutter/flavors.dart';

class Configs {
  // Add configs here
  final String baseUrl;

  // Initialize configs here
  Configs._dev() : baseUrl = Networks.devBaseUrl;

  Configs._prod() : baseUrl = Networks.baseUrl;

  factory Configs(Flavor? flavor) {
    switch (flavor) {
      case Flavor.dev:
        _instance = Configs._dev();
        break;
      case Flavor.prod:
        _instance = Configs._prod();
        break;
      default:
        _instance = Configs._dev();
        break;
    }
    return instance;
  }

  static Configs? _instance;
  static Configs get instance =>
      _instance ?? Configs(F.appFlavor ?? Flavor.dev);
}
