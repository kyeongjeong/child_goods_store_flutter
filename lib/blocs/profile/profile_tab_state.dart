import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/chat_item_type.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/product/product_preview_model.dart';
import 'package:child_goods_store_flutter/models/purchase/purchase_model.dart';
import 'package:child_goods_store_flutter/models/together/together_preview_model.dart';

class ProfileTabState extends BlocState {
  final EChatItemType category;

  final ELoadingStatus myProductsStatus;
  final String? myProductsMessage;
  final List<ProductPreviewModel> myProducts;

  final ELoadingStatus myTogethersStatus;
  final String? myTogethersMessage;
  final List<TogetherPreviewModel> myTogethers;

  final ELoadingStatus heartProductsStatus;
  final String? heartProductsMessage;
  final List<ProductPreviewModel> heartProducts;

  final ELoadingStatus heartTogethersStatus;
  final String? heartTogethersMessage;
  final List<TogetherPreviewModel> heartTogethers;

  final ELoadingStatus purchaseProductsStatus;
  final String? purchaseProductsMessage;
  final List<PurchaseModel> purchaseProducts;

  final ELoadingStatus purchaseTogethersStatus;
  final String? purchaseTogethersMessage;
  final List<PurchaseModel> purchaseTogethers;

  // TODO: review list

  const ProfileTabState({
    required this.category,
    //
    required this.myProductsStatus,
    this.myProductsMessage,
    required this.myProducts,
    //
    required this.myTogethersStatus,
    this.myTogethersMessage,
    required this.myTogethers,
    //
    required this.heartProductsStatus,
    this.heartProductsMessage,
    required this.heartProducts,
    //
    required this.heartTogethersStatus,
    this.heartTogethersMessage,
    required this.heartTogethers,
    //
    required this.purchaseProductsStatus,
    this.purchaseProductsMessage,
    required this.purchaseProducts,
    //
    required this.purchaseTogethersStatus,
    this.purchaseTogethersMessage,
    required this.purchaseTogethers,
    //
    required super.status,
    super.message,
  });

  const ProfileTabState.init()
      : category = EChatItemType.product,
        //
        myProductsStatus = ELoadingStatus.init,
        myProductsMessage = null,
        myProducts = const [],
        //
        myTogethersStatus = ELoadingStatus.init,
        myTogethersMessage = null,
        myTogethers = const [],
        //
        heartProductsStatus = ELoadingStatus.init,
        heartProductsMessage = null,
        heartProducts = const [],
        //
        heartTogethersStatus = ELoadingStatus.init,
        heartTogethersMessage = null,
        heartTogethers = const [],
        //
        purchaseProductsStatus = ELoadingStatus.init,
        purchaseProductsMessage = null,
        purchaseProducts = const [],
        //
        purchaseTogethersStatus = ELoadingStatus.init,
        purchaseTogethersMessage = null,
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
    //
    ELoadingStatus? myProductsStatus,
    String? myProductsMessage,
    List<ProductPreviewModel>? myProducts,
    //
    ELoadingStatus? myTogethersStatus,
    String? myTogethersMessage,
    List<TogetherPreviewModel>? myTogethers,
    //
    ELoadingStatus? heartProductsStatus,
    String? heartProductsMessage,
    List<ProductPreviewModel>? heartProducts,
    //
    ELoadingStatus? heartTogethersStatus,
    String? heartTogethersMessage,
    List<TogetherPreviewModel>? heartTogethers,
    //
    ELoadingStatus? purchaseProductsStatus,
    String? purchaseProductsMessage,
    List<PurchaseModel>? purchaseProducts,
    //
    ELoadingStatus? purchaseTogethersStatus,
    String? purchaseTogethersMessage,
    List<PurchaseModel>? purchaseTogethers,
  }) =>
      ProfileTabState(
        status: status ?? this.status,
        message: message ?? this.message,
        category: category ?? this.category,
        //
        myProductsStatus: myProductsStatus ?? this.myProductsStatus,
        myProductsMessage: myProductsMessage ?? this.myProductsMessage,
        myProducts: myProducts ?? this.myProducts,
        //
        myTogethersStatus: myTogethersStatus ?? this.myTogethersStatus,
        myTogethersMessage: myTogethersMessage ?? this.myTogethersMessage,
        myTogethers: myTogethers ?? this.myTogethers,
        //
        heartProductsStatus: heartProductsStatus ?? this.heartProductsStatus,
        heartProductsMessage: heartProductsMessage ?? this.heartProductsMessage,
        heartProducts: heartProducts ?? this.heartProducts,
        //
        heartTogethersStatus: heartTogethersStatus ?? this.heartTogethersStatus,
        heartTogethersMessage:
            heartTogethersMessage ?? this.heartTogethersMessage,
        heartTogethers: heartTogethers ?? this.heartTogethers,
        //
        purchaseProductsStatus:
            purchaseProductsStatus ?? this.purchaseProductsStatus,
        purchaseProductsMessage:
            purchaseProductsMessage ?? this.purchaseProductsMessage,
        purchaseProducts: purchaseProducts ?? this.purchaseProducts,
        //
        purchaseTogethersStatus:
            purchaseTogethersStatus ?? this.purchaseTogethersStatus,
        purchaseTogethersMessage:
            purchaseTogethersMessage ?? this.purchaseTogethersMessage,
        purchaseTogethers: purchaseTogethers ?? this.purchaseTogethers,
      );

  @override
  List<Object?> get props => [
        status,
        message,
        category,
        //
        myProductsStatus,
        myProductsMessage,
        myProducts,
        //
        myTogethersStatus,
        myTogethersMessage,
        myTogethers,
        //
        heartProductsStatus,
        heartProductsMessage,
        heartProducts,
        //
        heartTogethersStatus,
        heartTogethersMessage,
        heartTogethers,
        //
        purchaseProductsStatus,
        purchaseProductsMessage,
        purchaseProducts,
        //
        purchaseTogethersStatus,
        purchaseTogethersMessage,
        purchaseTogethers,
      ];
}
