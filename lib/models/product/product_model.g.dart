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
      mainCategory: EMainCategory.fromJson(json['mainCategory'] as String?),
      subCategory: ESubCategory.fromJson(json['subCategory'] as String?),
      productState: EProductState.fromJson(json['productState'] as String?),
      state: EProductSaleState.fromJson(json['state'] as String?),
      createAt: json['createAt'] == null
          ? null
          : DateTime.parse(json['createAt'] as String),
      updateAt: json['updateAt'] == null
          ? null
          : DateTime.parse(json['updateAt'] as String),
      tag: (json['tag'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      productImage: (json['productImage'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      productHeart: json['productHeart'] as bool?,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'user': instance.user?.toJson(),
      'productName': instance.productName,
      'price': instance.price,
      'content': instance.content,
      'mainCategory': EMainCategory.toJson(instance.mainCategory),
      'subCategory': ESubCategory.toJson(instance.subCategory),
      'productState': EProductState.toJson(instance.productState),
      'state': EProductSaleState.toJson(instance.state),
      'createAt': instance.createAt?.toIso8601String(),
      'updateAt': instance.updateAt?.toIso8601String(),
      'tag': instance.tag,
      'productImage': instance.productImage,
      'productHeart': instance.productHeart,
    };
