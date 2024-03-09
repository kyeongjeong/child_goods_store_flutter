import 'package:child_goods_store_flutter/blocs/auth/auth_bloc_singleton.dart';
import 'package:child_goods_store_flutter/interceptors/auth_interceptor.dart';
import 'package:child_goods_store_flutter/interceptors/un_auth_interceptor.dart';
import 'package:child_goods_store_flutter/models/res/res_model.dart';
import 'package:child_goods_store_flutter/models/user/user_model.dart';
import 'package:child_goods_store_flutter/models/user/user_profile_model.dart';
import 'package:child_goods_store_flutter/utils/mock_dio_exception.dart';
import 'package:dio/dio.dart';

class UserRepository {
  Future<ResModel<UserModel>> getUser() async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // dio.get('/user');

    // TODO: api connect
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<UserModel>(
      code: 1000,
      data: UserModel(
        userIdx: 1,
        nickName: 'Woong test',
        introduce: 'Hello world',
        phoneNum: '01012345678',
        profileImg: '',
        region: '경기도',
        town: '안양시',
        createAt: DateTime.now(),
      ),
    ).toJson(
      (user) => user.toJson(),
    );

    var res = ResModel<UserModel>.fromJson(
      resTmp,
      (json) => UserModel.fromJson(json),
    );

    return res;
  }

  Future<ResModel<UserModel>> postUser({
    required UserModel user,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // dio.post(
    //   '/user',
    //   data: user.toJson(),
    // );

    // TODO: api connect
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<UserModel>(
      code: 1000,
      data: user,
    ).toJson(
      (user) => user.toJson(),
    );

    var res = ResModel<UserModel>.fromJson(
      resTmp,
      (json) => UserModel.fromJson(json),
    );

    return res;
  }

  Future<ResModel<UserModel>> patchUser({
    required UserModel user,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // dio.patch(
    //   '/user',
    //   data: user.toJson(),
    // );

    // TODO: api connect
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<UserModel>(
      code: 1000,
      data: user,
    ).toJson(
      (user) => user.toJson(),
    );

    var res = ResModel<UserModel>.fromJson(
      resTmp,
      (json) => UserModel.fromJson(json),
    );

    return res;
  }

  Future<ResModel<UserProfileModel>> getMyProfile() async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // dio.get('/user/profile');

    // TODO: api connect
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<UserProfileModel>(
      code: 1000,
      data: UserProfileModel(
        userIdx: AuthBlocSingleton.bloc.state.user?.userIdx,
        nickName: AuthBlocSingleton.bloc.state.user?.nickName,
        profileImg: AuthBlocSingleton.bloc.state.user?.profileImg,
        introduce: AuthBlocSingleton.bloc.state.user?.introduce,
        followNum: 10,
        followingNum: 20,
        averageStars: 4.5,
        createAt: DateTime.now(),
      ),
    ).toJson(
      (userProfile) => userProfile.toJson(),
    );

    var res = ResModel<UserProfileModel>.fromJson(
      resTmp,
      (json) => UserProfileModel.fromJson(json),
    );

    return res;
  }

  Future<ResModel<UserProfileModel>> getUserProfile({
    required int userIdx,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(UnAuthInterceptor());
    // dio.get('/user/profile/$userIdx');

    // TODO: api connect
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<UserProfileModel>(
      code: 1000,
      data: UserProfileModel(
        userIdx: 999,
        nickName: 'extra user',
        profileImg:
            'https://lh4.googleusercontent.com/on7Yj1rShJRRBy88rTmptLVzMI4gEBDBabmSMv-GGsPIo5umfS5dpSJp3b4EoqKtnxdOYXeHSyct6m2fLYKckaikrUJn91PNWkIYXtkrCljcvdEnGdf_nQM5Qw6bQY4q6jvbWiBcC3WPTIcDS_lizv3R25oVAF_H0PNzvRo7JivPSiZR',
        introduce: 'hello flutter',
        followNum: 10,
        followingNum: 20,
        averageStars: 4.5,
        createAt: DateTime.now(),
      ),
    ).toJson(
      (userProfile) => userProfile.toJson(),
    );

    var res = ResModel<UserProfileModel>.fromJson(
      resTmp,
      (json) => UserProfileModel.fromJson(json),
    );

    return res;
  }
}
