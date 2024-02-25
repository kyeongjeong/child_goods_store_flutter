import 'package:child_goods_store_flutter/constants/networks.dart';
import 'package:child_goods_store_flutter/flavors.dart';

class Config {
  final String baseUrl;

  Config._dev() : baseUrl = Networks.devBaseUrl;

  Config._prod() : baseUrl = Networks.baseUrl;

  factory Config(Flavor? flavor) {
    switch (flavor) {
      case Flavor.dev:
        _instance = Config._dev();
        break;
      case Flavor.prod:
        _instance = Config._prod();
        break;
      default:
        _instance = Config._dev();
        break;
    }
    return instance;
  }

  static Config? _instance;
  static Config get instance => _instance ?? Config(F.appFlavor ?? Flavor.dev);
}
