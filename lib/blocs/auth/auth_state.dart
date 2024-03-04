import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/auth_status.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/user/user_model.dart';

class AuthState extends BlocState {
  final EAuthStatus authStatus;
  final UserModel? user;

  const AuthState({
    required this.authStatus,
    this.user,
    required super.status,
    super.message,
  });

  const AuthState.init()
      : authStatus = EAuthStatus.init,
        user = null,
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  AuthState copyWith({
    EAuthStatus? authStatus,
    UserModel? user,
    ELoadingStatus? status,
    String? message,
  }) =>
      AuthState(
        authStatus: authStatus ?? this.authStatus,
        user: user ?? this.user,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        authStatus,
        user,
        status,
        message,
      ];
}
