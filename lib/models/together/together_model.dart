import 'package:child_goods_store_flutter/enums/main_category.dart';
import 'package:child_goods_store_flutter/enums/product_sale_status.dart';
import 'package:child_goods_store_flutter/enums/sub_category.dart';
import 'package:child_goods_store_flutter/models/user/user_profile_model.dart';
import 'package:child_goods_store_flutter/utils/string_to_list_converter.dart';
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
      fromJson: EProductSaleStatus.fromJson,
      toJson: EProductSaleStatus.toJson,
    )
    EProductSaleStatus? status,
    String? link,
    DateTime? deadline,
    String? address,
    String? detailAddress,
    int? totalNum,
    int? purchaseNum,
    @JsonKey(fromJson: strToList, toJson: listToStr)
    @Default([])
    List<String> tag,
    @JsonKey(fromJson: strToList, toJson: listToStr)
    @Default([])
    List<String> togetherImage,
    bool? togetherHeart,
  }) = _TogetherModel;

  factory TogetherModel.fromJson(Map<String, dynamic> json) =>
      _$TogetherModelFromJson(json);
}
