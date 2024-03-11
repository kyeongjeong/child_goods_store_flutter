import 'dart:convert';
import 'package:child_goods_store_flutter/enums/address_category.dart';
import 'package:child_goods_store_flutter/interceptors/auth_interceptor.dart';
import 'package:child_goods_store_flutter/models/address/address_model.dart';
import 'package:child_goods_store_flutter/models/res/res_model.dart';
import 'package:child_goods_store_flutter/utils/mock_dio_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class DataRepository {
  Future<Map<String, List<String>>> getAdminDistrict() async {
    // TODO: remove
    await Future.delayed(const Duration(seconds: 1));

    // Get json data
    var jsonStr = await rootBundle
        .loadString('assets/jsons/korea-administrative-district.json');
    Map<String, List<String>> districtData = {};
    // Deserialize
    var jsonData = await json.decode(jsonStr)['data'] as List<dynamic>;
    for (var data in jsonData) {
      var cast = data as Map<String, dynamic>;
      String key = cast.keys.first;
      List<String> values = List<String>.from(cast[key] as List<dynamic>);
      districtData[key] = values;
    }

    return districtData;
  }

  Future<ResModel<List<AddressModel>>> getAddress() async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // dio.get('/address');

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<List<AddressModel>>(
      code: 1000,
      data: [
        AddressModel(
          addressId: 1,
          address: '경기도 안양시 동안구',
          detailAddress: '100동 200호',
          category: EAddressCategory.home,
        ),
        AddressModel(
          addressId: 2,
          address: '서울특별시 노원구',
          detailAddress: '새빛관 1층',
          category: EAddressCategory.school,
        ),
      ],
    ).toJson(
      (addresses) => addresses.map((address) => address.toJson()).toList(),
    );

    var res = ResModel<List<AddressModel>>.fromJson(
      resTmp,
      (json) => (json as List<dynamic>)
          .map((address) => AddressModel.fromJson(address))
          .toList(),
    );

    return res;
  }
}
