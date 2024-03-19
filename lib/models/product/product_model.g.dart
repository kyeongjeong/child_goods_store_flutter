// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      productId: json['productId'] as int?,
      user: json['user'] == null
          ? null
          : UserProfileModel.fromJson(json['user'] as Map<String, dynamic>),
      productName: json['productName'] as String?,
      price: json['price'] as int?,
      content: json['content'] as String?,
      productStatus:
          $enumDecodeNullable(_$EProductStatusEnumMap, json['productStatus']),
      state: $enumDecodeNullable(_$EProductSaleStatusEnumMap, json['state']),
      createAt: json['createAt'] == null
          ? null
          : DateTime.parse(json['createAt'] as String),
      updateAt: json['updateAt'] == null
          ? null
          : DateTime.parse(json['updateAt'] as String),
      tag: json['tag'] == null ? const [] : strToList(json['tag'] as String?),
      productImage: json['productImage'] == null
          ? const []
          : strToList(json['productImage'] as String?),
      productHeart: json['productHeart'] as bool?,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'user': instance.user?.toJson(),
      'productName': instance.productName,
      'price': instance.price,
      'content': instance.content,
      'productStatus': _$EProductStatusEnumMap[instance.productStatus],
      'state': _$EProductSaleStatusEnumMap[instance.state],
      'createAt': instance.createAt?.toIso8601String(),
      'updateAt': instance.updateAt?.toIso8601String(),
      'tag': listToStr(instance.tag),
      'productImage': listToStr(instance.productImage),
      'productHeart': instance.productHeart,
    };

const _$EProductStatusEnumMap = {
  EProductStatus.noUsage: 'noUsage',
  EProductStatus.littleUsage: 'littleUsage',
  EProductStatus.manyUsage: 'manyUsage',
  EProductStatus.extremeUsage: 'extremeUsage',
};

const _$EProductSaleStatusEnumMap = {
  EProductSaleStatus.sale: 'sale',
  EProductSaleStatus.reserved: 'reserved',
  EProductSaleStatus.soldout: 'soldout',
};
