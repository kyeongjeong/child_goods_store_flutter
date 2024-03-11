// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      addressId: json['addressId'] as int?,
      address: json['address'] as String?,
      detailAddress: json['detailAddress'] as String?,
      category:
          $enumDecodeNullable(_$EAddressCategoryEnumMap, json['category']),
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'addressId': instance.addressId,
      'address': instance.address,
      'detailAddress': instance.detailAddress,
      'category': _$EAddressCategoryEnumMap[instance.category],
    };

const _$EAddressCategoryEnumMap = {
  EAddressCategory.home: 'home',
  EAddressCategory.work: 'work',
  EAddressCategory.school: 'school',
  EAddressCategory.etc: 'etc',
};
