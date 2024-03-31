import 'package:child_goods_store_flutter/enums/main_category.dart';
import 'package:child_goods_store_flutter/enums/product_sale_state.dart';
import 'package:child_goods_store_flutter/enums/sub_category.dart';
import 'package:child_goods_store_flutter/models/user/user_profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'together_model.freezed.dart';
part 'together_model.g.dart';

@freezed
class TogetherModel with _$TogetherModel {
  factory TogetherModel({
    int? togetherId,
    UserProfileModel? user,
    String? togetherName,
    String? details,
    int? totalPrice,
    int? purchasePrice,
    @JsonKey(
      fromJson: EMainCategory.fromJson,
      toJson: EMainCategory.toJson,
    )
    EMainCategory? mainCategory,
    @JsonKey(
      fromJson: ESubCategory.fromJson,
      toJson: ESubCategory.toJson,
    )
    ESubCategory? subCategory,
    @JsonKey(
      fromJson: EProductSaleState.fromJson,
      toJson: EProductSaleState.toJson,
    )
    EProductSaleState? state,
    String? link,
    DateTime? deadline,
    String? address,
    String? detailAddress,
    int? totalNum,
    int? purchaseNum,
    @Default([]) List<String> tag,
    @Default([]) List<String> togetherImage,
    bool? togetherHeart,
  }) = _TogetherModel;

  factory TogetherModel.fromJson(Map<String, dynamic> json) =>
      _$TogetherModelFromJson(json);
}
