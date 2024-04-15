import 'package:child_goods_store_flutter/enums/chat_item_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class ReviewModel with _$ReviewModel {
  factory ReviewModel({
    int? reviewId,
    @JsonKey(
      fromJson: EChatItemType.fromJson,
      toJson: EChatItemType.toJson,
    )
    EChatItemType? type,
    int? id,
    int? userId,
    String? userName,
    double? averageStars,
    int? totalReview,
    int? score,
    String? content,
    DateTime? createdAt,
    String? name,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}
