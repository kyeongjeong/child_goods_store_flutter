import 'package:child_goods_store_flutter/enums/auth_status.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final EAuthStatus status;
  final String? message;
  // TODO: UserModel

  const AuthState({
    required this.status,
    this.message,
  });

  const AuthState.init()
      : status = EAuthStatus.init,
        message = null;

  AuthState copyWith({
    EAuthStatus? status,
    String? message,
  }) =>
      AuthState(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        status,
        message,
      ];
}
