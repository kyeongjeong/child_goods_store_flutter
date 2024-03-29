// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'together_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TogetherModelImpl _$$TogetherModelImplFromJson(Map<String, dynamic> json) =>
    _$TogetherModelImpl(
      togetherId: json['togetherId'] as int?,
      user: json['user'] == null
          ? null
          : UserProfileModel.fromJson(json['user'] as Map<String, dynamic>),
      togetherName: json['togetherName'] as String?,
      details: json['details'] as String?,
      totalPrice: json['totalPrice'] as int?,
      purchacePrice: json['purchacePrice'] as int?,
      mainCategory: EMainCategory.fromJson(json['mainCategory'] as String?),
      subCategory: ESubCategory.fromJson(json['subCategory'] as String?),
      status: EProductSaleStatus.fromJson(json['status'] as String?),
      link: json['link'] as String?,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      address: json['address'] as String?,
      detailAddress: json['detailAddress'] as String?,
      totalNum: json['totalNum'] as int?,
      purchaseNum: json['purchaseNum'] as int?,
      tag: json['tag'] == null ? const [] : strToList(json['tag'] as String?),
      togetherImage: json['togetherImage'] == null
          ? const []
          : strToList(json['togetherImage'] as String?),
      togetherHeart: json['togetherHeart'] as bool?,
    );

Map<String, dynamic> _$$TogetherModelImplToJson(_$TogetherModelImpl instance) =>
    <String, dynamic>{
      'togetherId': instance.togetherId,
      'user': instance.user?.toJson(),
      'togetherName': instance.togetherName,
      'details': instance.details,
      'totalPrice': instance.totalPrice,
      'purchacePrice': instance.purchacePrice,
      'mainCategory': EMainCategory.toJson(instance.mainCategory),
      'subCategory': ESubCategory.toJson(instance.subCategory),
      'status': EProductSaleStatus.toJson(instance.status),
      'link': instance.link,
      'deadline': instance.deadline?.toIso8601String(),
      'address': instance.address,
      'detailAddress': instance.detailAddress,
      'totalNum': instance.totalNum,
      'purchaseNum': instance.purchaseNum,
      'tag': listToStr(instance.tag),
      'togetherImage': listToStr(instance.togetherImage),
      'togetherHeart': instance.togetherHeart,
    };
