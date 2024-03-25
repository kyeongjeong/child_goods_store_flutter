import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/product/product_model.dart';
import 'package:image_picker/image_picker.dart';

class EditProductState extends BlocState {
  final ProductModel product;
  final List<XFile> newImage;
  final int? result;

  const EditProductState({
    required this.product,
    required this.newImage,
    this.result,
    required super.status,
    super.message,
  });

  EditProductState.init({ProductModel? product})
      : product = product ?? ProductModel(),
        newImage = const [],
        result = null,
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  EditProductState copyWith({
    ELoadingStatus? status,
    String? message,
    ProductModel? product,
    List<XFile>? newImage,
    int? result,
  }) =>
      EditProductState(
        product: product ?? this.product,
        newImage: newImage ?? this.newImage,
        result: result ?? this.result,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        product,
        newImage,
        result,
        status,
        message,
      ];
}
