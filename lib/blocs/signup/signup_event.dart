abstract class SignupEvent {}

class SignupChangeEmail extends SignupEvent {
  final String email;

  SignupChangeEmail(this.email);
}

class SignupChangePW extends SignupEvent {
  final String password;

  SignupChangePW(this.password);
}

class SignupChangePWCheck extends SignupEvent {
  final String passwordCheck;

  SignupChangePWCheck(this.passwordCheck);
}

class SignupChangeSendCode extends SignupEvent {}

class SignupChangeVerifyCode extends SignupEvent {
  final String code;

  SignupChangeVerifyCode(this.code);
}

// @Deprecated('phone verify is deprecated')
// class SignupChangePhoneNum extends SignupEvent {
//   final String phoneNum;

//   SignupChangePhoneNum(this.phoneNum);
// }

class SignupSubmit extends SignupEvent {}
