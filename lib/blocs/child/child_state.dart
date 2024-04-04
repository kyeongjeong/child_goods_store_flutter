import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/child/child_model.dart';
import 'package:child_goods_store_flutter/models/product/product_preview_model.dart';

class ChildState extends BlocState {
  final ELoadingStatus childListStatus;
  final List<ChildModel> childList;
  final ChildModel? selectedChild;
  final ELoadingStatus productListStatus;
  final List<ProductPreviewModel> productList;

  const ChildState({
    required this.childListStatus,
    required this.childList,
    this.selectedChild,
    required this.productListStatus,
    required this.productList,
    required super.status,
    super.message,
  });

  const ChildState.init()
      : childListStatus = ELoadingStatus.init,
        childList = const [],
        selectedChild = null,
        productListStatus = ELoadingStatus.init,
        productList = const [],
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  ChildState copyWith({
    ELoadingStatus? childListStatus,
    List<ChildModel>? childList,
    ChildModel? selectedChild,
    ELoadingStatus? status,
    ELoadingStatus? productListStatus,
    List<ProductPreviewModel>? productList,
    String? message,
    bool nullSelectedChild = false,
  }) =>
      ChildState(
        childListStatus: childListStatus ?? this.childListStatus,
        childList: childList ?? this.childList,
        selectedChild:
            nullSelectedChild ? null : (selectedChild ?? this.selectedChild),
        productListStatus: productListStatus ?? this.productListStatus,
        productList: productList ?? this.productList,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        childListStatus,
        childList,
        selectedChild,
        productListStatus,
        productList,
        status,
        message,
      ];
}
