import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/auth_status.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';

class AuthState extends BlocState {
  final EAuthStatus authStatus;
  // TODO: UserModel

  const AuthState({
    required this.authStatus,
    required super.status,
    super.message,
  });

  const AuthState.init()
      : authStatus = EAuthStatus.unknown,
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  AuthState copyWith({
    EAuthStatus? authStatus,
    ELoadingStatus? status,
    String? message,
  }) =>
      AuthState(
        authStatus: authStatus ?? this.authStatus,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        authStatus,
        status,
        message,
      ];
}
