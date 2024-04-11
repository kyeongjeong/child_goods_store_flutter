import 'package:child_goods_store_flutter/enums/chat_item_type.dart';

abstract class ProfileTabEvent {}

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
