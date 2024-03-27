// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'together_preview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TogetherPreviewModelImpl _$$TogetherPreviewModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TogetherPreviewModelImpl(
      togetherId: json['togetherId'] as int?,
      togetherName: json['togetherName'] as String?,
      totalPrice: json['totalPrice'] as int?,
      purchasePrice: json['purchasePrice'] as int?,
      totalNum: json['totalNum'] as int?,
      purchaseNum: json['purchaseNum'] as int?,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      productImage: json['productImage'] as String?,
      productHeart: json['productHeart'] as bool?,
    );

Map<String, dynamic> _$$TogetherPreviewModelImplToJson(
        _$TogetherPreviewModelImpl instance) =>
    <String, dynamic>{
      'togetherId': instance.togetherId,
      'togetherName': instance.togetherName,
      'totalPrice': instance.totalPrice,
      'purchasePrice': instance.purchasePrice,
      'totalNum': instance.totalNum,
      'purchaseNum': instance.purchaseNum,
      'deadline': instance.deadline?.toIso8601String(),
      'productImage': instance.productImage,
      'productHeart': instance.productHeart,
    };
