import 'package:flutter_bloc/flutter_bloc.dart';

enum ESplash {
  init('초기화 중'),
  extraData('기타 데이터를 로드하는 중'),
  getUser('사용자 정보를 불러오는 중');

  final String text;

  const ESplash(this.text);
}

class SplashCubit extends Cubit<ESplash> {
  SplashCubit() : super(ESplash.init);

  void setSplash(ESplash splash) => emit(splash);
}
