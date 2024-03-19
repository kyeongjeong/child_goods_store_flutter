import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/user/user_profile_model.dart';

class ProductBuyerState extends BlocState {
  final List<UserProfileModel>? buyers;

  const ProductBuyerState({
    this.buyers,
    required super.status,
    super.message,
  });

  const ProductBuyerState.init()
      : buyers = null,
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  ProductBuyerState copyWith({
    ELoadingStatus? status,
    String? message,
    List<UserProfileModel>? buyers,
  }) =>
      ProductBuyerState(
        status: status ?? this.status,
        message: message ?? this.message,
        buyers: buyers ?? this.buyers,
      );

  @override
  List<Object?> get props => [
        status,
        message,
        buyers,
      ];
}
