import 'package:child_goods_store_flutter/enums/chat_item_type.dart';
import 'package:equatable/equatable.dart';

class GoRouterExtraModel<T> extends Equatable {
  final bool? refreshWhenPop;
  final EChatItemType? itemType;
  final int? itemId;
  final T? data;

  const GoRouterExtraModel({
    this.refreshWhenPop,
    this.itemType,
    this.itemId,
    this.data,
  });

  @override
  List<Object?> get props => [
        refreshWhenPop,
        itemType,
        itemId,
        data,
      ];
}
