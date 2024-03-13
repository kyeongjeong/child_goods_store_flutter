import 'package:child_goods_store_flutter/GA/models/ga_event_interface.dart';

class GAViewEvent extends GAEvents {
  final String page;
  final int? id;

  GAViewEvent({
    required this.page,
    this.id,
  }) : super(type: 'VIEW');

  @override
  Map<String, dynamic> toJson() => {
        'userId': userId ?? -1,
        'page': page,
        'id': id ?? -1,
        'eventAt': eventAt.toIso8601String(),
      };
}
