import 'package:child_goods_store_flutter/enums/address_category.dart';

abstract class EditAddressEvent {}

class EditAddressChangeCategory extends EditAddressEvent {
  final EAddressCategory category;

  EditAddressChangeCategory(this.category);
}

class EditAddressChangeAddress extends EditAddressEvent {
  final String address;

  EditAddressChangeAddress(this.address);
}

class EditAddressChangeDetail extends EditAddressEvent {
  final String detailAddress;

  EditAddressChangeDetail(this.detailAddress);
}

class EditAddressSubmit extends EditAddressEvent {}
