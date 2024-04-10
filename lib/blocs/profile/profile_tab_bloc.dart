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
        );

        List<ProductPreviewModel> newList = [];
        newList
          ..addAll(state.myProducts)
          ..addAll(res.data ?? []);

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          myProductsStatus: ELoadingStatus.loaded,
          myProducts: newList,
        ));
      },
      state: state,
      emit: emit,
      initAfterError: false,
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
        );

        List<TogetherPreviewModel> newList = [];
        newList
          ..addAll(state.myTogethers)
          ..addAll(res.data ?? []);

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          myTogethersStatus: ELoadingStatus.loaded,
          myTogethers: newList,
        ));
      },
      state: state,
      emit: emit,
      initAfterError: false,
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
        var res = await profileRepository.getProfileProductHeartList();

        List<ProductPreviewModel> newList = [];
        newList
          ..addAll(state.heartProducts)
          ..addAll(res.data ?? []);

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          heartProductsStatus: ELoadingStatus.loaded,
          heartProducts: newList,
        ));
      },
      state: state,
      emit: emit,
      initAfterError: false,
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
        var res = await profileRepository.getProfileTogetherHeartList();

        List<TogetherPreviewModel> newList = [];
        newList
          ..addAll(state.heartTogethers)
          ..addAll(res.data ?? []);

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          heartTogethersStatus: ELoadingStatus.loaded,
          heartTogethers: newList,
        ));
      },
      state: state,
      emit: emit,
      initAfterError: false,
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
        var res = await profileRepository.getProfileProductPurchaseList();

        List<PurchaseModel> newList = [];
        newList
          ..addAll(state.purchaseProducts)
          ..addAll(res.data ?? []);

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          purchaseProductsStatus: ELoadingStatus.loaded,
          purchaseProducts: newList,
        ));
      },
      state: state,
      emit: emit,
      initAfterError: false,
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
        var res = await profileRepository.getProfileTogetherPurchaseList();

        List<PurchaseModel> newList = [];
        newList
          ..addAll(state.purchaseTogethers)
          ..addAll(res.data ?? []);

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          purchaseTogethersStatus: ELoadingStatus.loaded,
          purchaseTogethers: newList,
        ));
      },
      state: state,
      emit: emit,
      initAfterError: false,
    );
  }
}
