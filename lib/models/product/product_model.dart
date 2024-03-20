import 'package:child_goods_store_flutter/enums/product_sale_status.dart';
import 'package:child_goods_store_flutter/enums/product_status.dart';
import 'package:child_goods_store_flutter/models/user/user_profile_model.dart';
import 'package:child_goods_store_flutter/utils/string_to_list_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    int? productId,
    UserProfileModel? user,
    String? productName,
    int? price,
    String? content,
    @JsonKey(
      fromJson: EProductStatus.fromJson,
      toJson: EProductStatus.toJson,
    )
    EProductStatus? productStatus,
    @JsonKey(
      fromJson: EProductSaleStatus.fromJson,
      toJson: EProductSaleStatus.toJson,
    )
    EProductSaleStatus? state,
    DateTime? createAt,
    DateTime? updateAt,
    @JsonKey(fromJson: strToList, toJson: listToStr)
    @Default([])
    List<String> tag,
    @JsonKey(fromJson: strToList, toJson: listToStr)
    @Default([])
    List<String> productImage,
    bool? productHeart,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
