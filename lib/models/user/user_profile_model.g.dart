// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileModelImpl _$$UserProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileModelImpl(
      userId: json['userId'] as int?,
      nickName: json['nickName'] as String?,
      introduce: json['introduce'] as String?,
      profileImg: json['profileImg'] as String?,
      followNum: json['followNum'] as int?,
      followingNum: json['followingNum'] as int?,
      averageStars: (json['averageStars'] as num?)?.toDouble(),
      createAt: json['createAt'] == null
          ? null
          : DateTime.parse(json['createAt'] as String),
    );

Map<String, dynamic> _$$UserProfileModelImplToJson(
        _$UserProfileModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickName': instance.nickName,
      'introduce': instance.introduce,
      'profileImg': instance.profileImg,
      'followNum': instance.followNum,
      'followingNum': instance.followingNum,
      'averageStars': instance.averageStars,
      'createAt': instance.createAt?.toIso8601String(),
    };
