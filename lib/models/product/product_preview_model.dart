import 'package:child_goods_store_flutter/enums/product_sale_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_preview_model.freezed.dart';
part 'product_preview_model.g.dart';

@freezed
class ProductPreviewModel with _$ProductPreviewModel {
  factory ProductPreviewModel({
    int? productId,
    String? productName,
    int? price,
    @JsonKey(
      fromJson: EProductSaleStatus.fromJson,
      toJson: EProductSaleStatus.toJson,
    )
    EProductSaleStatus? state,
    String? productImage,
    bool? productHeart,
  }) = _ProductPreviewModel;

  factory ProductPreviewModel.fromJson(Map<String, dynamic> json) =>
      _$ProductPreviewModelFromJson(json);
}
