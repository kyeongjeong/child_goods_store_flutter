import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/chat_item_type.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/product/product_preview_model.dart';
import 'package:child_goods_store_flutter/models/purchase/purchase_model.dart';
import 'package:child_goods_store_flutter/models/together/together_preview_model.dart';

class ProfileTabState extends BlocState {
  final double outerScrollPos;
  final EChatItemType category;

  final double myScrollPos;
  final ELoadingStatus myProductsStatus;
  final List<ProductPreviewModel> myProducts;
  final ELoadingStatus myTogethersStatus;
  final List<TogetherPreviewModel> myTogethers;

  final double heartScrollPos;
  final ELoadingStatus heartProductsStatus;
  final List<ProductPreviewModel> heartProducts;
  final ELoadingStatus heartTogethersStatus;
  final List<TogetherPreviewModel> heartTogethers;

  final double purchaseScrollPos;
  final ELoadingStatus purchaseProductsStatus;
  final List<PurchaseModel> purchaseProducts;
  final ELoadingStatus purchaseTogethersStatus;
  final List<PurchaseModel> purchaseTogethers;

  // TODO: review list

  const ProfileTabState({
    required this.outerScrollPos,
    required this.category,
    required this.myScrollPos,
    required this.myProductsStatus,
    required this.myProducts,
    required this.myTogethersStatus,
    required this.myTogethers,
    required this.heartScrollPos,
    required this.heartProductsStatus,
    required this.heartProducts,
    required this.heartTogethersStatus,
    required this.heartTogethers,
    required this.purchaseScrollPos,
    required this.purchaseProductsStatus,
    required this.purchaseProducts,
    required this.purchaseTogethersStatus,
    required this.purchaseTogethers,
    required super.status,
    super.message,
  });

  const ProfileTabState.init()
      : outerScrollPos = 0,
        category = EChatItemType.product,
        myScrollPos = 0,
        myProductsStatus = ELoadingStatus.init,
        myProducts = const [],
        myTogethersStatus = ELoadingStatus.init,
        myTogethers = const [],
        heartScrollPos = 0,
        heartProductsStatus = ELoadingStatus.init,
        heartProducts = const [],
        heartTogethersStatus = ELoadingStatus.init,
        heartTogethers = const [],
        purchaseScrollPos = 0,
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
    double? outerScrollPos,
    EChatItemType? category,
    double? myScrollPos,
    ELoadingStatus? myProductsStatus,
    List<ProductPreviewModel>? myProducts,
    ELoadingStatus? myTogethersStatus,
    List<TogetherPreviewModel>? myTogethers,
    double? heartScrollPos,
    ELoadingStatus? heartProductsStatus,
    List<ProductPreviewModel>? heartProducts,
    ELoadingStatus? heartTogethersStatus,
    List<TogetherPreviewModel>? heartTogethers,
    double? purchaseScrollPos,
    ELoadingStatus? purchaseProductsStatus,
    List<PurchaseModel>? purchaseProducts,
    ELoadingStatus? purchaseTogethersStatus,
    List<PurchaseModel>? purchaseTogethers,
  }) =>
      ProfileTabState(
        status: status ?? this.status,
        message: message ?? this.message,
        outerScrollPos: outerScrollPos ?? this.outerScrollPos,
        category: category ?? this.category,
        myScrollPos: myScrollPos ?? this.myScrollPos,
        myProductsStatus: myProductsStatus ?? this.myProductsStatus,
        myProducts: myProducts ?? this.myProducts,
        myTogethersStatus: myTogethersStatus ?? this.myTogethersStatus,
        myTogethers: myTogethers ?? this.myTogethers,
        heartScrollPos: heartScrollPos ?? this.heartScrollPos,
        heartProductsStatus: heartProductsStatus ?? this.heartProductsStatus,
        heartProducts: heartProducts ?? this.heartProducts,
        heartTogethersStatus: heartTogethersStatus ?? this.heartTogethersStatus,
        heartTogethers: heartTogethers ?? this.heartTogethers,
        purchaseScrollPos: purchaseScrollPos ?? this.purchaseScrollPos,
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
        outerScrollPos,
        category,
        myScrollPos,
        myProductsStatus,
        myProducts,
        myTogethersStatus,
        myTogethers,
        heartScrollPos,
        heartProductsStatus,
        heartProducts,
        heartTogethersStatus,
        heartTogethers,
        purchaseScrollPos,
        purchaseProductsStatus,
        purchaseProducts,
        purchaseTogethersStatus,
        purchaseTogethers,
      ];
}
