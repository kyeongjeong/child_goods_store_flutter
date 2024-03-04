abstract class PhoneVerifyEvent {}

class PhoneVerifyChangeNum extends PhoneVerifyEvent {
  final String phoneNum;

  PhoneVerifyChangeNum(this.phoneNum);
}

class PhoneVerifyChangeCode extends PhoneVerifyEvent {
  final String code;

  PhoneVerifyChangeCode(this.code);
}

class PhoneVerifySubmit extends PhoneVerifyEvent {}
