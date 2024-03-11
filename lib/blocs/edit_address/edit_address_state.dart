import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/address/address_model.dart';

class EditAddressState extends BlocState {
  final AddressModel address;
  final AddressModel? result;

  const EditAddressState({
    required this.address,
    this.result,
    required super.status,
    super.message,
  });

  EditAddressState.init({AddressModel? address})
      : address = address ?? AddressModel(),
        result = null,
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  EditAddressState copyWith({
    AddressModel? address,
    AddressModel? result,
    ELoadingStatus? status,
    String? message,
  }) =>
      EditAddressState(
        address: address ?? this.address,
        result: result ?? this.result,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        address,
        result,
        status,
        message,
      ];
}
