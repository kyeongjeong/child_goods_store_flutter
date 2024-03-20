import 'package:bloc/bloc.dart';
import 'package:child_goods_store_flutter/blocs/product/list/product_list_event.dart';
import 'package:child_goods_store_flutter/blocs/product/list/product_list_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/mixins/dio_exception_handler.dart';
import 'package:child_goods_store_flutter/models/product/product_preview_model.dart';
import 'package:child_goods_store_flutter/repositories/product_repository.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState>
    with DioExceptionHandlerMixin {
  final ProductRepository productRepository;

  ProductListBloc({
    required this.productRepository,
  }) : super(const ProductListState.init()) {
    on<ProductListGet>(_productListGetHandler);

    add(ProductListGet());
  }

  Future<void> _productListGetHandler(
    ProductListGet event,
    Emitter<ProductListState> emit,
  ) async {
    if (state.status == ELoadingStatus.loading) return;

    await handleApiRequest(
      () async {
        emit(state.copyWith(status: ELoadingStatus.loading));

        var res = await productRepository.getProductList();

        List<ProductPreviewModel> newList = [];
        newList
          ..addAll(state.products)
          ..addAll(res.data ?? []);

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          products: newList,
        ));
      },
      state: state,
      emit: emit,
      initAfterError: false,
    );
  }
}
