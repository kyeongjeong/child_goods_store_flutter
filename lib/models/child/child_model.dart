import 'package:child_goods_store_flutter/utils/string_to_list_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'child_model.freezed.dart';
part 'child_model.g.dart';

@freezed
class ChildModel with _$ChildModel {
  factory ChildModel({
    int? childId,
    String? name,
    int? age, // month
    String? gender, // M or W
    String? childImg,
    @JsonKey(fromJson: strToList, toJson: listToStr)
    @Default([])
    List<String> tag,
  }) = _ChildModel;

  factory ChildModel.fromJson(Map<String, dynamic> json) =>
      _$ChildModelFromJson(json);
}
