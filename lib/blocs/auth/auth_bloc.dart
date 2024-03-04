import 'package:bloc/bloc.dart';
import 'package:child_goods_store_flutter/blocs/auth/auth_event.dart';
import 'package:child_goods_store_flutter/blocs/auth/auth_state.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/auth_method.dart';
import 'package:child_goods_store_flutter/enums/auth_status.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/mixins/dio_exception_handler.dart';
import 'package:child_goods_store_flutter/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>
    with ChangeNotifier, DioExceptionHandlerMixin {
  final AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(const AuthState.init()) {
    on<AuthGoogleSignin>(_authGoogleSigninHandler);
    on<AuthNaverSignin>(_authNaverSigninHandler);
    on<AuthKakaoSignin>(_authKakaoSigninHandler);
    on<AuthSignout>(_authSignoutHandler);
    on<Auth3C1SSignin>(_auth3C1SSigninHandler);
  }

  Future<void> _authGoogleSigninHandler(
    AuthGoogleSignin event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState(
        status: ELoadingStatus.loading,
        authStatus: EAuthStatus.init,
      ));
      // oauth2 with google
      var res = await authRepository.signinWithGoogle();

      await _authSignin(
        emit,
        method: EAuthMethod.google,
        accessToken: res,
      );
    } catch (e) {
      debugPrint(e.toString());
      emit(AuthState(
        status: ELoadingStatus.error,
        authStatus: EAuthStatus.init,
        message: e.toString(),
      ));
    } finally {
      notifyListeners();
    }
  }

  Future<void> _authNaverSigninHandler(
    AuthNaverSignin event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState(
        status: ELoadingStatus.loading,
        authStatus: EAuthStatus.init,
      ));
      // oauth2 with naver
      var res = await authRepository.signinWithNaver();

      await _authSignin(
        emit,
        method: EAuthMethod.naver,
        accessToken: res,
      );
    } catch (e) {
      debugPrint(e.toString());
      emit(AuthState(
        status: ELoadingStatus.error,
        authStatus: EAuthStatus.init,
        message: e.toString(),
      ));
    } finally {
      notifyListeners();
    }
  }

  Future<void> _authKakaoSigninHandler(
    AuthKakaoSignin event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState(
        status: ELoadingStatus.loading,
        authStatus: EAuthStatus.init,
      ));
      // oauth2 with kakao
      var res = await authRepository.signinWithKakao();

      await _authSignin(
        emit,
        method: EAuthMethod.kakao,
        accessToken: res,
      );
    } catch (e) {
      debugPrint(e.toString());
      emit(AuthState(
        status: ELoadingStatus.error,
        authStatus: EAuthStatus.init,
        message: e.toString(),
      ));
    } finally {
      notifyListeners();
    }
  }

  Future<void> _authSignin(
    Emitter<AuthState> emit, {
    required EAuthMethod method,
    required String accessToken,
  }) async {
    print(accessToken);
    // try {
    //   var res = await authRepository.dudeSignin(
    //     method: method,
    //     accessToken: accessToken,
    //   );

    //   // Save jwt at secure_storage
    //   FlutterSecureStorage storage = const FlutterSecureStorage();
    //   await storage.write(
    //     key: Strings.jwtToken,
    //     value: res.data,
    //   );

    //   // Return to splash screen
    //   emit(const AuthState(status: EAuthStatus.init));
    // } on DioException catch (e) {
    //   var error = e.error as ResModel<void>;

    //   emit(AuthState(
    //     status: EAuthStatus.error,
    //     message: '[${error.code}] ${error.message as String}',
    //   ));
    // } catch (e) {
    //   emit(AuthState(
    //     status: EAuthStatus.error,
    //     message: '[5001] ${e.toString()}',
    //   ));
    // }
  }

  Future<void> _authSignoutHandler(
    AuthSignout event,
    Emitter<AuthState> emit,
  ) async {
    try {
      // Remove jwt at secure_storage
      FlutterSecureStorage storage = const FlutterSecureStorage();
      await storage.delete(key: Strings.jwtToken);

      await authRepository.signoutWithGoogle();
      await authRepository.signoutWithNaver();

      emit(const AuthState(
        status: ELoadingStatus.loaded,
        authStatus: EAuthStatus.unknown,
      ));
    } catch (e) {
      emit(AuthState(
        status: ELoadingStatus.error,
        authStatus: EAuthStatus.init,
        message: e.toString(),
      ));
    } finally {
      notifyListeners();
    }
  }

  Future<void> _auth3C1SSigninHandler(
    Auth3C1SSignin event,
    Emitter<AuthState> emit,
  ) async {
    if (state.status == ELoadingStatus.loading) return;

    // Validate
    if (event.email == null || event.email == Strings.nullStr) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '이메일을 입력해주세요.',
      ));
      emit(state.copyWith(status: ELoadingStatus.init));
      return;
    }
    if (event.password == null || event.password == Strings.nullStr) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '비밀번호를 입력해주세요.',
      ));
      emit(state.copyWith(status: ELoadingStatus.init));
      return;
    }

    await handleApiRequest(
      () async {
        emit(state.copyWith(status: ELoadingStatus.loading));
        var res = await authRepository.signinWith3C1S(
          email: event.email!,
          password: event.password!,
        );

        var jwt = res.data;
        if (jwt == null) {
          throw Exception('로그인에 실패했습니다.');
        }
        // Save jwt at secure_storage
        _saveJwt(jwt);
        // Return to splash screen
        emit(const AuthState(
          status: ELoadingStatus.loaded,
          authStatus: EAuthStatus.init,
        ));
      },
      state: state,
      emit: emit,
    );
  }

  Future<void> _saveJwt(String jwt) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.write(
      key: Strings.jwtToken,
      value: jwt,
    );
  }
}
