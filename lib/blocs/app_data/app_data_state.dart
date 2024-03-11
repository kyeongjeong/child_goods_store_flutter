import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/address/address_model.dart';

class AppDataState extends BlocState {
  final ELoadingStatus regionStatus;
  final Map<String, List<String>> region;
  final ELoadingStatus addressStatus;
  final List<AddressModel> addresses;

  const AppDataState({
    required this.regionStatus,
    required this.region,
    required this.addressStatus,
    required this.addresses,
    required super.status,
    super.message,
  });

  AppDataState.init()
      : regionStatus = ELoadingStatus.init,
        region = {},
        addressStatus = ELoadingStatus.init,
        addresses = [],
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  AppDataState copyWith({
    ELoadingStatus? regionStatus,
    Map<String, List<String>>? region,
    ELoadingStatus? addressStatus,
    List<AddressModel>? addresses,
    ELoadingStatus? status,
    String? message,
  }) =>
      AppDataState(
        regionStatus: regionStatus ?? this.regionStatus,
        region: region ?? this.region,
        addressStatus: addressStatus ?? this.addressStatus,
        addresses: addresses ?? this.addresses,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        regionStatus,
        region,
        addressStatus,
        addresses,
        status,
        message,
      ];
}
