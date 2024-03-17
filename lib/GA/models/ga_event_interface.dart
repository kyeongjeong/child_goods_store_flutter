import 'package:child_goods_store_flutter/blocs/auth/auth_bloc_singleton.dart';

abstract class GAEvents {
  final String type;
  final int? userId;
  final DateTime eventAt;

  GAEvents({
    required this.type,
  })  : userId = AuthBlocSingleton.bloc.state.user?.userId,
        eventAt = DateTime.now();

  Map<String, dynamic> toJson();
}
