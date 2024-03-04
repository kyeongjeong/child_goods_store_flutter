import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';

class SignupState extends BlocState {
  final String? email;
  final String? password;
  final String? passwordCheck;
  final String? phoneNum;

  const SignupState({
    this.email,
    this.password,
    this.passwordCheck,
    this.phoneNum,
    required super.status,
    super.message,
  });

  const SignupState.init()
      : email = null,
        password = null,
        passwordCheck = null,
        phoneNum = null,
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  SignupState copyWith({
    ELoadingStatus? status,
    String? message,
    String? email,
    String? password,
    String? passwordCheck,
    String? phoneNum,
  }) =>
      SignupState(
        email: email ?? this.email,
        password: password ?? this.password,
        passwordCheck: passwordCheck ?? this.passwordCheck,
        phoneNum: phoneNum ?? this.phoneNum,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        email,
        password,
        passwordCheck,
        phoneNum,
        status,
        message,
      ];
}
