import 'package:child_goods_store_flutter/blocs/product/detail/product_detail_event.dart';
import 'package:child_goods_store_flutter/blocs/product/detail/product_detail_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/enums/product_sale_status.dart';
import 'package:child_goods_store_flutter/mixins/dio_exception_handler.dart';
import 'package:child_goods_store_flutter/models/res/res_model.dart';
import 'package:child_goods_store_flutter/repositories/product_repository.dart';
import 'package:child_goods_store_flutter/utils/mock_dio_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState>
    with DioExceptionHandlerMixin {
  final ProductRepository productRepository;
  final int productId;

  ProductDetailBloc({
    required this.productRepository,
    required this.productId,
  }) : super(const ProductDetailState.init()) {
    on<ProductDetailGet>(_productDetailGetHandler);
    on<ProductDetailChangeSaleStatus>(_productDetailChangeSaleStatusHandler);
    on<ProductDetailChangeHeart>(_productDetailChangeHeartHandler);

    add(ProductDetailGet());
  }

  Future<void> _productDetailGetHandler(
    ProductDetailGet event,
    Emitter<ProductDetailState> emit,
  ) async {
    if (state.status == ELoadingStatus.loading &&
        state.productStatus == ELoadingStatus.loading) return;

    emit(state.copyWith(
      status: ELoadingStatus.loading,
      productStatus: ELoadingStatus.loading,
    ));
    await handleApiRequest(
      () async {
        var res = await productRepository.getProduct(
          productId: productId,
        );

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          productStatus: ELoadingStatus.loaded,
          productModel: res.data,
        ));
      },
      state: state,
      emit: emit,
      initAfterError: false,
    );
  }

  Future<void> _productDetailChangeSaleStatusHandler(
    ProductDetailChangeSaleStatus event,
    Emitter<ProductDetailState> emit,
  ) async {
    if (state.status == ELoadingStatus.loading &&
        state.changeSaleStatus == ELoadingStatus.loading) return;

    if (event.status != EProductSaleStatus.soldout &&
        state.productModel?.state == event.status) return;

    emit(state.copyWith(
      status: ELoadingStatus.loading,
      changeSaleStatus: ELoadingStatus.loading,
    ));
    await handleApiRequest(
      () async {
        if (event.status == EProductSaleStatus.soldout &&
            event.userId == null) {
          mockThrowDioError(
            errorModel: ResModel(
              code: 5000,
              message: '구매자가 설정되지 않았습니다.',
            ),
          );
          return;
        }

        await productRepository.postProductStatus(
          status: event.status,
          productId: productId,
          saledUserId: event.userId,
        );

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          changeSaleStatus: ELoadingStatus.loaded,
          productModel: state.productModel?.copyWith(
            state: event.status,
          ),
        ));
      },
      state: state,
      emit: emit,
      finallyCall: () async {
        emit(state.copyWith(
          status: ELoadingStatus.init,
          changeSaleStatus: ELoadingStatus.init,
        ));
      },
    );
  }

  Future<void> _productDetailChangeHeartHandler(
    ProductDetailChangeHeart event,
    Emitter<ProductDetailState> emit,
  ) async {
    if (state.status == ELoadingStatus.loading &&
        state.heartStatus == ELoadingStatus.loading) return;

    bool prevState = state.productModel?.productHeart ?? false;

    // on event -> change
    emit(state.copyWith(
      productModel: state.productModel?.copyWith(
        productHeart: !prevState,
      ),
      status: ELoadingStatus.loading,
      heartStatus: ELoadingStatus.loading,
    ));
    await handleApiRequest(
      () async {
        if (prevState) {
          await productRepository.deleteProductHeart(
            productId: productId,
          );
        } else {
          await productRepository.postProductHeart(
            productId: productId,
          );
        }
        // on success -> keep state
        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          heartStatus: ELoadingStatus.loaded,
        ));
      },
      state: state,
      emit: emit,
      initAfterError: false,
      finallyCall: () async {
        // on error -> rollback
        if (state.status == ELoadingStatus.error &&
            state.heartStatus == ELoadingStatus.loading) {
          emit(state.copyWith(
            status: ELoadingStatus.init,
            heartStatus: ELoadingStatus.init,
            productModel: state.productModel?.copyWith(
              productHeart: prevState,
            ),
          ));
        } else {
          emit(state.copyWith(
            status: ELoadingStatus.init,
            heartStatus: ELoadingStatus.init,
          ));
        }
      },
    );
  }
}
