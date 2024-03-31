import 'package:child_goods_store_flutter/enums/product_sale_state.dart';
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
      fromJson: EProductSaleState.fromJson,
      toJson: EProductSaleState.toJson,
    )
    EProductSaleState? state,
    String? productImage,
    bool? productHeart,
  }) = _ProductPreviewModel;

  factory ProductPreviewModel.fromJson(Map<String, dynamic> json) =>
      _$ProductPreviewModelFromJson(json);
}
