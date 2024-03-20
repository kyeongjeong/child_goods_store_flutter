// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChildModelImpl _$$ChildModelImplFromJson(Map<String, dynamic> json) =>
    _$ChildModelImpl(
      childId: json['childId'] as int?,
      name: json['name'] as String?,
      age: EChildAge.fromJson(json['age'] as String?),
      gender: EChildGender.fromJson(json['gender'] as String?),
      childImg: json['childImg'] as String?,
      tag: json['tag'] == null ? const [] : strToList(json['tag'] as String?),
    );

Map<String, dynamic> _$$ChildModelImplToJson(_$ChildModelImpl instance) =>
    <String, dynamic>{
      'childId': instance.childId,
      'name': instance.name,
      'age': EChildAge.toJson(instance.age),
      'gender': EChildGender.toJson(instance.gender),
      'childImg': instance.childImg,
      'tag': listToStr(instance.tag),
    };
