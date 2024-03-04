import 'package:child_goods_store_flutter/interceptors/un_auth_interceptor.dart';
import 'package:child_goods_store_flutter/models/res/res_model.dart';
import 'package:child_goods_store_flutter/utils/mock_dio_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class AuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['openid', 'email'],
  );

  Future<String> signinWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();

    if (googleSignInAccount == null) {
      throw Exception('Google Sign-In was canceled');
    }

    final GoogleSignInAuthentication googleAuth =
        await googleSignInAccount.authentication;

    if (googleAuth.accessToken == null) {
      throw Exception('Failed to get AccessToken');
    }
    // if (googleAuth.idToken == null) {
    //   throw Exception('Failed to get IdToken');
    // }

    return googleAuth.accessToken!;
  }

  Future<void> signoutWithGoogle() async {
    await _googleSignIn.signOut();
    return;
  }

  Future<String> signinWithKakao() async {
    if (await isKakaoTalkInstalled()) {
      try {
        final kakaoToken = await UserApi.instance.loginWithKakaoTalk();

        return kakaoToken.accessToken;
      } catch (e) {
        if (e is PlatformException && e.code == 'CANCELED') {
          throw Exception('Kakao Sign-In was canceled');
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        final kakaoToken = await UserApi.instance.loginWithKakaoAccount();

        return kakaoToken.accessToken;
      }
    } else {
      final kakaoToken = await UserApi.instance.loginWithKakaoAccount();

      return kakaoToken.accessToken;
    }
  }

  Future<String> signinWithNaver() async {
    NaverLoginResult result = await FlutterNaverLogin.logIn();

    if (result.status == NaverLoginStatus.error) {
      throw Exception('Failed to get AccessToken');
    }
    if (result.status == NaverLoginStatus.cancelledByUser) {
      throw Exception('Naver Sign-In was canceled');
    }

    NaverAccessToken accessToken = await FlutterNaverLogin.currentAccessToken;

    return accessToken.accessToken;
  }

  Future<void> signoutWithNaver() async {
    await FlutterNaverLogin.logOut();
    return;
  }

  Future<ResModel<String>> signinWith3C1S({
    required String email,
    required String password,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(UnAuthInterceptor());
    // var res = await dio.post(
    //   '/auth',
    //   data: {
    //     'email': email,
    //     'password': password,
    //   },
    // );

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<String>(
      code: 1000,
      data: 'test_jwt_token',
    ).toJson((token) => token.toString());

    var res = ResModel<String>.fromJson(
      resTmp,
      (json) => json.toString(),
    );

    return res;
  }

  Future<ResModel<void>> postPhoneSend({
    required String phoneNum,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(UnAuthInterceptor());
    // dio.post(
    //   '/phone/send',
    //   data: {
    //     'phoneNum': phoneNum,
    //   },
    // );

    // TODO: api connect
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<void>(code: 1000).toJson((p0) => null);

    var res = ResModel<void>.fromJson(resTmp, (json) {});

    return res;
  }

  Future<ResModel<void>> postPhoneVerify({
    required String code,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(UnAuthInterceptor());
    // dio.post(
    //   '/phone/verify',
    //   data: {
    //     'code': code,
    //   },
    // );

    // TODO: api connect
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<void>(code: 1000).toJson((p0) => null);

    var res = ResModel<void>.fromJson(resTmp, (json) {});

    return res;
  }

  Future<ResModel<void>> postSignup({
    required String email,
    required String password,
    required String phoneNum,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(UnAuthInterceptor());
    // dio.post(
    //   '/signup',
    //   data: {
    //     'email': email,
    //     'password': password,
    //     'phoneNum': phoneNum,
    //   }
    // );

    // TODO: api connect
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<void>(code: 1000).toJson((p0) => null);

    var res = ResModel<void>.fromJson(resTmp, (json) {});

    return res;
  }
}
