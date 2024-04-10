import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/chat_item_type.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/product/product_preview_model.dart';
import 'package:child_goods_store_flutter/models/purchase/purchase_model.dart';
import 'package:child_goods_store_flutter/models/together/together_preview_model.dart';

class ProfileTabState extends BlocState {
  final EChatItemType category;

  final ELoadingStatus myProductsStatus;
  final List<ProductPreviewModel> myProducts;
  final ELoadingStatus myTogethersStatus;
  final List<TogetherPreviewModel> myTogethers;

  final ELoadingStatus heartProductsStatus;
  final List<ProductPreviewModel> heartProducts;
  final ELoadingStatus heartTogethersStatus;
  final List<TogetherPreviewModel> heartTogethers;

  final ELoadingStatus purchaseProductsStatus;
  final List<PurchaseModel> purchaseProducts;
  final ELoadingStatus purchaseTogethersStatus;
  final List<PurchaseModel> purchaseTogethers;

  // TODO: review list

  const ProfileTabState({
    required this.category,
    required this.myProductsStatus,
    required this.myProducts,
    required this.myTogethersStatus,
    required this.myTogethers,
    required this.heartProductsStatus,
    required this.heartProducts,
    required this.heartTogethersStatus,
    required this.heartTogethers,
    required this.purchaseProductsStatus,
    required this.purchaseProducts,
    required this.purchaseTogethersStatus,
    required this.purchaseTogethers,
    required super.status,
    super.message,
  });

  const ProfileTabState.init()
      : category = EChatItemType.product,
        myProductsStatus = ELoadingStatus.init,
        myProducts = const [],
        myTogethersStatus = ELoadingStatus.init,
        myTogethers = const [],
        heartProductsStatus = ELoadingStatus.init,
        heartProducts = const [],
        heartTogethersStatus = ELoadingStatus.init,
        heartTogethers = const [],
        purchaseProductsStatus = ELoadingStatus.init,
        purchaseProducts = const [],
        purchaseTogethersStatus = ELoadingStatus.init,
        purchaseTogethers = const [],
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  ProfileTabState copyWith({
    ELoadingStatus? status,
    String? message,
    EChatItemType? category,
    ELoadingStatus? myProductsStatus,
    List<ProductPreviewModel>? myProducts,
    ELoadingStatus? myTogethersStatus,
    List<TogetherPreviewModel>? myTogethers,
    ELoadingStatus? heartProductsStatus,
    List<ProductPreviewModel>? heartProducts,
    ELoadingStatus? heartTogethersStatus,
    List<TogetherPreviewModel>? heartTogethers,
    ELoadingStatus? purchaseProductsStatus,
    List<PurchaseModel>? purchaseProducts,
    ELoadingStatus? purchaseTogethersStatus,
    List<PurchaseModel>? purchaseTogethers,
  }) =>
      ProfileTabState(
        status: status ?? this.status,
        message: message ?? this.message,
        category: category ?? this.category,
        myProductsStatus: myProductsStatus ?? this.myProductsStatus,
        myProducts: myProducts ?? this.myProducts,
        myTogethersStatus: myTogethersStatus ?? this.myTogethersStatus,
        myTogethers: myTogethers ?? this.myTogethers,
        heartProductsStatus: heartProductsStatus ?? this.heartProductsStatus,
        heartProducts: heartProducts ?? this.heartProducts,
        heartTogethersStatus: heartTogethersStatus ?? this.heartTogethersStatus,
        heartTogethers: heartTogethers ?? this.heartTogethers,
        purchaseProductsStatus:
            purchaseProductsStatus ?? this.purchaseProductsStatus,
        purchaseProducts: purchaseProducts ?? this.purchaseProducts,
        purchaseTogethersStatus:
            purchaseTogethersStatus ?? this.purchaseTogethersStatus,
        purchaseTogethers: purchaseTogethers ?? this.purchaseTogethers,
      );

  @override
  List<Object?> get props => [
        status,
        message,
        category,
        myProductsStatus,
        myProducts,
        myTogethersStatus,
        myTogethers,
        heartProductsStatus,
        heartProducts,
        heartTogethersStatus,
        heartTogethers,
        purchaseProductsStatus,
        purchaseProducts,
        purchaseTogethersStatus,
        purchaseTogethers,
      ];
}
