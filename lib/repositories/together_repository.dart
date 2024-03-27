import 'package:child_goods_store_flutter/enums/child_age.dart';
import 'package:child_goods_store_flutter/enums/child_gender.dart';
import 'package:child_goods_store_flutter/enums/main_category.dart';
import 'package:child_goods_store_flutter/enums/search_range.dart';
import 'package:child_goods_store_flutter/enums/sub_category.dart';
import 'package:child_goods_store_flutter/interceptors/un_auth_interceptor.dart';
import 'package:child_goods_store_flutter/models/res/res_model.dart';
import 'package:child_goods_store_flutter/models/together/together_preview_model.dart';
import 'package:child_goods_store_flutter/utils/mock_dio_exception.dart';
import 'package:dio/dio.dart';

class TogetherRepository {
  Future<ResModel<List<TogetherPreviewModel>>> getTogetherList({
    required ESearchRange region,
    EMainCategory? mainCategory,
    ESubCategory? subCategory,
    EChildAge? age,
    EChildGender? gender,
  }) async {
    Map<String, dynamic> queryParams = {};
    queryParams['region'] = region.key;
    if (mainCategory != null) {
      queryParams['mainCategory'] = mainCategory.key;
    }
    if (subCategory != null) {
      queryParams['subCategory'] = subCategory.key;
    }
    if (age != null) {
      queryParams['age'] = age.key;
    }
    if (gender != null) {
      queryParams['gender'] = gender.key;
    }

    // Dio dio = Dio();
    // dio.interceptors.add(UnAuthInterceptor());
    // dio.get(
    //   '/together',
    //   queryParameters: queryParams,
    // );

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<List<TogetherPreviewModel>>(
      code: 1000,
      data: [
        for (var togetherId in List.generate(10, (index) => index + 1))
          TogetherPreviewModel(
            togetherId: togetherId,
            togetherName: '$togetherId th product',
            totalPrice: 120000,
            purchasePrice: 1200,
            totalNum: 100,
            purchaseNum: 6 * togetherId,
            deadline: DateTime.now(),
            productImage: togetherId % 3 == 0
                ? ''
                : 'https://lh4.googleusercontent.com/on7Yj1rShJRRBy88rTmptLVzMI4gEBDBabmSMv-GGsPIo5umfS5dpSJp3b4EoqKtnxdOYXeHSyct6m2fLYKckaikrUJn91PNWkIYXtkrCljcvdEnGdf_nQM5Qw6bQY4q6jvbWiBcC3WPTIcDS_lizv3R25oVAF_H0PNzvRo7JivPSiZR',
            productHeart: togetherId % 3 == 0 ? false : true,
          ),
      ],
    ).toJson(
      (products) => products.map((prod) => prod.toJson()).toList(),
    );

    var res = ResModel<List<TogetherPreviewModel>>.fromJson(
      resTmp,
      (json) => (json as List<dynamic>)
          .map((prod) => TogetherPreviewModel.fromJson(prod))
          .toList(),
    );

    return res;
  }
}
