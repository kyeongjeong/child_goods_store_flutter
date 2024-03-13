enum EAuthMethod {
  google('Google', '구글'),
  naver('Naver', '네이버'),
  kakao('Kakao', '카카오'),
  u3C1S('3C1S', '3C1S');

  final String key;
  final String ko;

  const EAuthMethod(
    this.key,
    this.ko,
  );
}
