// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      userIdx: json['userIdx'] as int?,
      nickName: json['nickName'] as String?,
      introduce: json['introduce'] as String?,
      profileImg: json['profileImg'] as String?,
      phoneNum: json['phoneNum'] as String?,
      region: json['region'] as String?,
      town: json['town'] as String?,
      createAt: json['createAt'] == null
          ? null
          : DateTime.parse(json['createAt'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'userIdx': instance.userIdx,
      'nickName': instance.nickName,
      'introduce': instance.introduce,
      'profileImg': instance.profileImg,
      'phoneNum': instance.phoneNum,
      'region': instance.region,
      'town': instance.town,
      'createAt': instance.createAt?.toIso8601String(),
    };
