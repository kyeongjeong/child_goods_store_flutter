import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/product/product_preview_model.dart';

class ProductListState extends BlocState {
  final List<ProductPreviewModel> products;

  const ProductListState({
    required this.products,
    required super.status,
    super.message,
  });

  const ProductListState.init()
      : products = const [],
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  ProductListState copyWith({
    ELoadingStatus? status,
    String? message,
    List<ProductPreviewModel>? products,
  }) =>
      ProductListState(
        status: status ?? this.status,
        message: message ?? this.message,
        products: products ?? this.products,
      );

  @override
  List<Object?> get props => [
        status,
        message,
        products,
      ];
}
