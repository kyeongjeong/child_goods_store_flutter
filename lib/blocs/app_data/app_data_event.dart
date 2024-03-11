import 'package:child_goods_store_flutter/models/address/address_model.dart';

abstract class AppDataEvent {}

class AppDataReset extends AppDataEvent {}

class AppDataLoadAdminDistrict extends AppDataEvent {}

class AppDataLoadAddress extends AppDataEvent {}

class AppDataUpdateAddress extends AppDataEvent {
  final AddressModel address;

  AppDataUpdateAddress(this.address);
}
