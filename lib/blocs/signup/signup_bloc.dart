import 'package:child_goods_store_flutter/blocs/signup/signup_event.dart';
import 'package:child_goods_store_flutter/blocs/signup/signup_state.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/mixins/dio_exception_handler.dart';
import 'package:child_goods_store_flutter/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState>
    with DioExceptionHandlerMixin {
  final AuthRepository authRepository;

  SignupBloc({
    required this.authRepository,
  }) : super(const SignupState.init()) {
    on<SignupChangeEmail>(_signupChangeEmailHandler);
    on<SignupChangePW>(_signupChangePWHandler);
    on<SignupChangePWCheck>(_signupChangePWCheckHandler);
    on<SignupChangePhoneNum>(_signupChangePhoneNumHandler);
    on<SignupSubmit>(_signupSubmitHandler);
  }

  Future<void> _signupChangeEmailHandler(
    SignupChangeEmail event,
    Emitter<SignupState> emit,
  ) async {
    emit(state.copyWith(
      email: event.email,
    ));
  }

  Future<void> _signupChangePWHandler(
    SignupChangePW event,
    Emitter<SignupState> emit,
  ) async {
    emit(state.copyWith(
      password: event.password,
    ));
  }

  Future<void> _signupChangePWCheckHandler(
    SignupChangePWCheck event,
    Emitter<SignupState> emit,
  ) async {
    emit(state.copyWith(
      passwordCheck: event.passwordCheck,
    ));
  }

  Future<void> _signupChangePhoneNumHandler(
    SignupChangePhoneNum event,
    Emitter<SignupState> emit,
  ) async {
    emit(state.copyWith(
      phoneNum: event.phoneNum,
    ));
  }

  Future<void> _signupSubmitHandler(
    SignupSubmit event,
    Emitter<SignupState> emit,
  ) async {
    if (state.status == ELoadingStatus.loading) return;

    // Validate
    if (state.email == null || state.email == Strings.nullStr) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '이메일을 입력해주세요.',
      ));
      emit(state.copyWith(status: ELoadingStatus.init));
      return;
    }
    if (state.password == null || state.password == Strings.nullStr) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '비밀번호를 입력해주세요.',
      ));
      emit(state.copyWith(status: ELoadingStatus.init));
      return;
    }
    if (state.password != state.passwordCheck) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '비밀번호를 다시 확인해주세요.',
      ));
      emit(state.copyWith(status: ELoadingStatus.init));
      return;
    }
    if (state.phoneNum == null || state.phoneNum == Strings.nullStr) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '핸드폰 인증을 진행해주세요.',
      ));
      emit(state.copyWith(status: ELoadingStatus.init));
      return;
    }

    await handleApiRequest(
      () async {
        emit(state.copyWith(status: ELoadingStatus.loading));
        await authRepository.postSignup(
          email: state.email!,
          password: state.password!,
          phoneNum: state.phoneNum!,
        );
        emit(state.copyWith(status: ELoadingStatus.loaded));
      },
      emit: emit,
      state: state,
    );
  }
}
