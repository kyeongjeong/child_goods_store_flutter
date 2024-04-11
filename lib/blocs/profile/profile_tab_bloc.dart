import 'package:child_goods_store_flutter/blocs/profile/profile_tab_event.dart';
import 'package:child_goods_store_flutter/blocs/profile/profile_tab_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/mixins/dio_exception_handler.dart';
import 'package:child_goods_store_flutter/models/product/product_preview_model.dart';
import 'package:child_goods_store_flutter/models/purchase/purchase_model.dart';
import 'package:child_goods_store_flutter/models/together/together_preview_model.dart';
import 'package:child_goods_store_flutter/repositories/profile_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTabBloc extends Bloc<ProfileTabEvent, ProfileTabState>
    with DioExceptionHandlerMixin {
  final ProfileRepository profileRepository;
  final int userId;

  ProfileTabBloc({
    required this.profileRepository,
    required this.userId,
  }) : super(const ProfileTabState.init()) {
    on<ProfileTabChangeCategory>(_profileTabChangeCategoryHandler);
    on<ProfileTabGetProducts>(_profileTabGetProductsHandler);
    on<ProfileTabGetTogethers>(_profileTabGetTogethersHandler);
    on<ProfileTabGetHeartProducts>(_profileTabGetHeartProductsHandler);
    on<ProfileTabGetHeartTogethers>(_profileTabGetHeartTogethersHandler);
    on<ProfileTabGetPurchaseProducts>(_profileTabGetPurchaseProductsHandler);
    on<ProfileTabGetPurchaseTogethers>(_profileTabGetPurchaseTogethersHandler);
  }
  Future<void> _profileTabChangeCategoryHandler(
    ProfileTabChangeCategory event,
    Emitter<ProfileTabState> emit,
  ) async {
    emit(state.copyWith(category: event.category));
  }

  Future<void> _profileTabGetProductsHandler(
    ProfileTabGetProducts event,
    Emitter<ProfileTabState> emit,
  ) async {
    if (state.status == ELoadingStatus.loading &&
        state.myProductsStatus == ELoadingStatus.loading) return;

    emit(state.copyWith(
      status: ELoadingStatus.loading,
      myProductsStatus: ELoadingStatus.loading,
    ));
    await handleApiRequest(
      () async {
        var res = await profileRepository.getProfileProductList(
          userId: userId,
          page: state.myProductsPage,
        );

        List<ProductPreviewModel> newList = [];
        newList
          ..addAll(state.myProducts)
          ..addAll(res.data ?? []);

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          myProductsStatus: ELoadingStatus.loaded,
          myProducts: newList,
          myProductsPage: state.myProductsPage + 1,
        ));
      },
      state: state,
      emit: emit,
      initAfterError: false,
      finallyCall: () async {
        if (state.status == ELoadingStatus.error) {
          emit(state.copyWith(
            myProductsStatus: ELoadingStatus.error,
            myProductsMessage: state.message,
          ));
        }
      },
    );
  }

  Future<void> _profileTabGetTogethersHandler(
    ProfileTabGetTogethers event,
    Emitter<ProfileTabState> emit,
  ) async {
    if (state.status == ELoadingStatus.loading &&
        state.myTogethersStatus == ELoadingStatus.loading) return;

    emit(state.copyWith(
      status: ELoadingStatus.loading,
      myTogethersStatus: ELoadingStatus.loading,
    ));
    await handleApiRequest(
      () async {
        var res = await profileRepository.getProfileTogetherList(
          userId: userId,
          page: state.myTogethersPage,
        );

        List<TogetherPreviewModel> newList = [];
        newList
          ..addAll(state.myTogethers)
          ..addAll(res.data ?? []);

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          myTogethersStatus: ELoadingStatus.loaded,
          myTogethers: newList,
          myTogethersPage: state.myTogethersPage + 1,
        ));
      },
      state: state,
      emit: emit,
      initAfterError: false,
      finallyCall: () async {
        if (state.status == ELoadingStatus.error) {
          emit(state.copyWith(
            myTogethersStatus: ELoadingStatus.error,
            myTogethersMessage: state.message,
          ));
        }
      },
    );
  }

  Future<void> _profileTabGetHeartProductsHandler(
    ProfileTabGetHeartProducts event,
    Emitter<ProfileTabState> emit,
  ) async {
    if (state.status == ELoadingStatus.loading &&
        state.heartProductsStatus == ELoadingStatus.loading) return;

    emit(state.copyWith(
      status: ELoadingStatus.loading,
      heartProductsStatus: ELoadingStatus.loading,
    ));
    await handleApiRequest(
      () async {
        var res = await profileRepository.getProfileProductHeartList(
          page: state.heartProductsPage,
        );

        List<ProductPreviewModel> newList = [];
        newList
          ..addAll(state.heartProducts)
          ..addAll(res.data ?? []);

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          heartProductsStatus: ELoadingStatus.loaded,
          heartProducts: newList,
          heartProductsPage: state.heartProductsPage + 1,
        ));
      },
      state: state,
      emit: emit,
      initAfterError: false,
      finallyCall: () async {
        if (state.status == ELoadingStatus.error) {
          emit(state.copyWith(
            heartProductsStatus: ELoadingStatus.error,
            heartProductsMessage: state.message,
          ));
        }
      },
    );
  }

  Future<void> _profileTabGetHeartTogethersHandler(
    ProfileTabGetHeartTogethers event,
    Emitter<ProfileTabState> emit,
  ) async {
    if (state.status == ELoadingStatus.loading &&
        state.heartTogethersStatus == ELoadingStatus.loading) return;

    emit(state.copyWith(
      status: ELoadingStatus.loading,
      heartTogethersStatus: ELoadingStatus.loading,
    ));
    await handleApiRequest(
      () async {
        var res = await profileRepository.getProfileTogetherHeartList(
          page: state.heartTogethersPage,
        );

        List<TogetherPreviewModel> newList = [];
        newList
          ..addAll(state.heartTogethers)
          ..addAll(res.data ?? []);

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          heartTogethersStatus: ELoadingStatus.loaded,
          heartTogethers: newList,
          heartTogethersPage: state.heartTogethersPage + 1,
        ));
      },
      state: state,
      emit: emit,
      initAfterError: false,
      finallyCall: () async {
        if (state.status == ELoadingStatus.error) {
          emit(state.copyWith(
            heartTogethersStatus: ELoadingStatus.error,
            heartTogethersMessage: state.message,
          ));
        }
      },
    );
  }

  Future<void> _profileTabGetPurchaseProductsHandler(
    ProfileTabGetPurchaseProducts event,
    Emitter<ProfileTabState> emit,
  ) async {
    if (state.status == ELoadingStatus.loading &&
        state.purchaseProductsStatus == ELoadingStatus.loading) return;

    emit(state.copyWith(
      status: ELoadingStatus.loading,
      purchaseProductsStatus: ELoadingStatus.loading,
    ));
    await handleApiRequest(
      () async {
        var res = await profileRepository.getProfileProductPurchaseList(
          page: state.purchaseProductsPage,
        );

        List<PurchaseModel> newList = [];
        newList
          ..addAll(state.purchaseProducts)
          ..addAll(res.data ?? []);

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          purchaseProductsStatus: ELoadingStatus.loaded,
          purchaseProducts: newList,
          purchaseProductsPage: state.purchaseProductsPage + 1,
        ));
      },
      state: state,
      emit: emit,
      initAfterError: false,
      finallyCall: () async {
        if (state.status == ELoadingStatus.error) {
          emit(state.copyWith(
            purchaseProductsStatus: ELoadingStatus.error,
            purchaseProductsMessage: state.message,
          ));
        }
      },
    );
  }

  Future<void> _profileTabGetPurchaseTogethersHandler(
    ProfileTabGetPurchaseTogethers event,
    Emitter<ProfileTabState> emit,
  ) async {
    if (state.status == ELoadingStatus.loading &&
        state.purchaseTogethersStatus == ELoadingStatus.loading) return;

    emit(state.copyWith(
      status: ELoadingStatus.loading,
      purchaseTogethersStatus: ELoadingStatus.loading,
    ));
    await handleApiRequest(
      () async {
        var res = await profileRepository.getProfileTogetherPurchaseList(
          page: state.purchaseTogethersPage,
        );

        List<PurchaseModel> newList = [];
        newList
          ..addAll(state.purchaseTogethers)
          ..addAll(res.data ?? []);

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          purchaseTogethersStatus: ELoadingStatus.loaded,
          purchaseTogethers: newList,
          purchaseTogethersPage: state.purchaseTogethersPage + 1,
        ));
      },
      state: state,
      emit: emit,
      initAfterError: false,
      finallyCall: () async {
        if (state.status == ELoadingStatus.error) {
          emit(state.copyWith(
            purchaseTogethersStatus: ELoadingStatus.error,
            purchaseTogethersMessage: state.message,
          ));
        }
      },
    );
  }
}
