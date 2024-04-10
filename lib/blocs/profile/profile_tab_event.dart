import 'package:child_goods_store_flutter/enums/chat_item_type.dart';

abstract class ProfileTabEvent {}

class ProfileTabScroll extends ProfileTabEvent {
  final double? outerScrollPos;
  final double? myScrollPos;
  final double? heartScrollPos;
  final double? purchaseScrollPos;

  ProfileTabScroll({
    this.outerScrollPos,
    this.myScrollPos,
    this.heartScrollPos,
    this.purchaseScrollPos,
  });
}

class ProfileTabChangeCategory extends ProfileTabEvent {
  final EChatItemType category;

  ProfileTabChangeCategory(this.category);
}

class ProfileTabGetProducts extends ProfileTabEvent {}

class ProfileTabGetTogethers extends ProfileTabEvent {}

class ProfileTabGetHeartProducts extends ProfileTabEvent {}

class ProfileTabGetHeartTogethers extends ProfileTabEvent {}

class ProfileTabGetPurchaseProducts extends ProfileTabEvent {}

class ProfileTabGetPurchaseTogethers extends ProfileTabEvent {}
