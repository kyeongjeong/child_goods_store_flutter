import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';

class SignupState extends BlocState {
  final String? email;
  final String? password;
  final String? passwordCheck;
  final ELoadingStatus sendStatus;
  final ELoadingStatus verifyStatus;

  /// `verifiedEmail == email` -> verified \
  /// `else` -> not verified
  final String? verifiedEmail;
  final ELoadingStatus submitStatus;

  // final String? phoneNum;

  const SignupState({
    this.email,
    this.password,
    this.passwordCheck,
    required this.sendStatus,
    required this.verifyStatus,
    this.verifiedEmail,
    required this.submitStatus,
    // this.phoneNum,
    required super.status,
    super.message,
  });

  const SignupState.init()
      : email = null,
        password = null,
        passwordCheck = null,
        sendStatus = ELoadingStatus.init,
        verifyStatus = ELoadingStatus.init,
        verifiedEmail = null,
        submitStatus = ELoadingStatus.init,
        // phoneNum = null,
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
    ELoadingStatus? sendStatus,
    ELoadingStatus? verifyStatus,
    String? verifiedEmail,
    ELoadingStatus? submitStatus,
    // String? phoneNum,
  }) =>
      SignupState(
        email: email ?? this.email,
        password: password ?? this.password,
        passwordCheck: passwordCheck ?? this.passwordCheck,
        sendStatus: sendStatus ?? this.sendStatus,
        verifyStatus: verifyStatus ?? this.verifyStatus,
        verifiedEmail: verifiedEmail ?? this.verifiedEmail,
        submitStatus: submitStatus ?? this.submitStatus,
        // phoneNum: phoneNum ?? this.phoneNum,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        email,
        password,
        passwordCheck,
        sendStatus,
        verifyStatus,
        verifiedEmail,
        submitStatus,
        // phoneNum,
        status,
        message,
      ];
}
