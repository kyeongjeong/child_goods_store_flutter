import 'package:child_goods_store_flutter/enums/child_age.dart';
import 'package:child_goods_store_flutter/enums/child_gender.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'child_model.freezed.dart';
part 'child_model.g.dart';

@freezed
class ChildModel with _$ChildModel {
  factory ChildModel({
    int? childId,
    String? name,
    @JsonKey(fromJson: EChildAge.fromJson, toJson: EChildAge.toJson)
    EChildAge? age,
    @JsonKey(fromJson: EChildGender.fromJson, toJson: EChildGender.toJson)
    EChildGender? gender,
    String? childImg,
    @Default([]) List<String> tag,
  }) = _ChildModel;

  factory ChildModel.fromJson(Map<String, dynamic> json) =>
      _$ChildModelFromJson(json);
}
