// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_preview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductPreviewModelImpl _$$ProductPreviewModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductPreviewModelImpl(
      productId: json['productId'] as int?,
      productName: json['productName'] as String?,
      price: json['price'] as int?,
      state: $enumDecodeNullable(_$EProductSaleStatusEnumMap, json['state']),
      productImage: json['productImage'] as String?,
      productHeart: json['productHeart'] as bool?,
    );

Map<String, dynamic> _$$ProductPreviewModelImplToJson(
        _$ProductPreviewModelImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'price': instance.price,
      'state': _$EProductSaleStatusEnumMap[instance.state],
      'productImage': instance.productImage,
      'productHeart': instance.productHeart,
    };

const _$EProductSaleStatusEnumMap = {
  EProductSaleStatus.sale: 'sale',
  EProductSaleStatus.reserved: 'reserved',
  EProductSaleStatus.soldout: 'soldout',
};
