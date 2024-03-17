import 'package:child_goods_store_flutter/GA/models/ga_event_interface.dart';
import 'package:child_goods_store_flutter/enums/auth_method.dart';

class GALoginEvent extends GAEvents {
  final EAuthMethod method;

  GALoginEvent({
    required this.method,
  }) : super(type: 'LOGIN');

  @override
  Map<String, dynamic> toJson() => {
        'userId': userId ?? -1,
        'method': method.key,
        'eventAt': eventAt.toIso8601String(),
      };
}
