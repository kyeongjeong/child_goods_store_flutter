import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';

class PhoneVerifyState extends BlocState {
  final String? phoneNum;
  final String? code;
  final ELoadingStatus phoneStatus;
  final ELoadingStatus codeStatus;

  const PhoneVerifyState({
    this.phoneNum,
    this.code,
    required this.phoneStatus,
    required this.codeStatus,
    required super.status,
    super.message,
  });

  const PhoneVerifyState.init()
      : phoneNum = null,
        code = null,
        phoneStatus = ELoadingStatus.init,
        codeStatus = ELoadingStatus.init,
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  PhoneVerifyState copyWith({
    ELoadingStatus? status,
    String? message,
    String? phoneNum,
    String? code,
    ELoadingStatus? phoneStatus,
    ELoadingStatus? codeStatus,
  }) =>
      PhoneVerifyState(
        status: status ?? this.status,
        message: message ?? this.message,
        phoneNum: phoneNum ?? this.phoneNum,
        code: code ?? this.code,
        phoneStatus: phoneStatus ?? this.phoneStatus,
        codeStatus: codeStatus ?? this.codeStatus,
      );

  @override
  List<Object?> get props => [
        phoneNum,
        code,
        phoneStatus,
        codeStatus,
        status,
        message,
      ];
}
