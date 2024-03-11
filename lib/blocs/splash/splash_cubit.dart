import 'package:flutter_bloc/flutter_bloc.dart';

enum ESplash {
  init('초기화 중'),
  adminDistrict('지역 정보를 로드하는 중'),
  getAddress('배송 주소 정보를 불러오는 중'),
  getUser('사용자 정보를 불러오는 중'),
  error('앱 초기화 실패');

  final String text;

  const ESplash(this.text);
}

class SplashCubit extends Cubit<ESplash> {
  SplashCubit() : super(ESplash.init);

  void setSplash(ESplash splash) => emit(splash);
}
