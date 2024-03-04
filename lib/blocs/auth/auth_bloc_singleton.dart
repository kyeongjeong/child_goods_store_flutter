import 'package:child_goods_store_flutter/blocs/auth/auth_bloc.dart';
import 'package:child_goods_store_flutter/repositories/auth_repository.dart';
import 'package:child_goods_store_flutter/repositories/user_repository.dart';

class AuthBlocSingleton {
  AuthBlocSingleton._constructor();
  static final AuthBlocSingleton _signleton = AuthBlocSingleton._constructor();
  static AuthBlocSingleton get instance => _signleton;

  static late final AuthBloc _bloc;
  static AuthBloc get bloc => _bloc;

  static initializer({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  }) {
    _bloc = AuthBloc(
      authRepository: authRepository,
      userRepository: userRepository,
    );
  }
}
