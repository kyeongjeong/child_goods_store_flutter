import 'package:freezed_annotation/freezed_annotation.dart';

part 'together_preview_model.freezed.dart';
part 'together_preview_model.g.dart';

@freezed
class TogetherPreviewModel with _$TogetherPreviewModel {
  factory TogetherPreviewModel({
    int? togetherId,
    String? togetherName,
    int? totalPrice,
    int? purchasePrice,
    int? totalNum,
    int? purchaseNum,
    DateTime? deadline,
    String? togetherImage,
    bool? togetherHeart,
  }) = _TogetherPreviewModel;

  factory TogetherPreviewModel.fromJson(Map<String, dynamic> json) =>
      _$TogetherPreviewModelFromJson(json);
}
