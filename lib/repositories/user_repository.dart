import 'package:child_goods_store_flutter/interceptors/auth_interceptor.dart';
import 'package:child_goods_store_flutter/models/res/res_model.dart';
import 'package:child_goods_store_flutter/models/user/user_model.dart';
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

  Future<ResModel<UserModel>> postUser({required UserModel user}) async {
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

  Future<ResModel<UserModel>> patchUser({required UserModel user}) async {
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
}
