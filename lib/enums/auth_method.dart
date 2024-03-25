enum EAuthMethod {
  auto('자동로그인'),
  google('구글'),
  naver('네이버'),
  kakao('카카오'),
  u3C1S('3C1S');

  final String text;

  const EAuthMethod(this.text);

  static String? toJson(EAuthMethod? en) {
    switch (en) {
      case EAuthMethod.auto:
        return 'AUTO';
      case EAuthMethod.google:
        return 'GOOGLE';
      case EAuthMethod.naver:
        return 'NAVER';
      case EAuthMethod.kakao:
        return 'KAKAO';
      case EAuthMethod.u3C1S:
        return 'U3C1S';
      default:
        return null;
    }
  }

  static EAuthMethod? fromJson(String? str) {
    switch (str?.toUpperCase()) {
      case 'AUTO':
        return EAuthMethod.auto;
      case 'GOOGLE':
        return EAuthMethod.google;
      case 'NAVER':
        return EAuthMethod.naver;
      case 'KAKAO':
        return EAuthMethod.kakao;
      case 'U3C1S':
        return EAuthMethod.u3C1S;
      default:
        return null;
    }
  }
}

extension EAuthMethodExtension on EAuthMethod {
  String get key {
    switch (this) {
      case EAuthMethod.auto:
        return 'AUTO';
      case EAuthMethod.google:
        return 'GOOGLE';
      case EAuthMethod.naver:
        return 'NAVER';
      case EAuthMethod.kakao:
        return 'KAKAO';
      case EAuthMethod.u3C1S:
        return 'U3C1S';
    }
  }
}
