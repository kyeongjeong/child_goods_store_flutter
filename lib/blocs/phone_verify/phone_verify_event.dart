abstract class PhoneVerifyEvent {}

class PhoneVerifyChangeNum extends PhoneVerifyEvent {
  String phoneNum;

  PhoneVerifyChangeNum(this.phoneNum);
}

class PhoneVerifyChangeCode extends PhoneVerifyEvent {
  String code;

  PhoneVerifyChangeCode(this.code);
}

class PhoneVerifySubmit extends PhoneVerifyEvent {}
