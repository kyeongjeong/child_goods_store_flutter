import 'package:child_goods_store_flutter/enums/child_age.dart';
import 'package:child_goods_store_flutter/enums/child_gender.dart';
import 'package:child_goods_store_flutter/enums/main_category.dart';
import 'package:child_goods_store_flutter/enums/product_sale_status.dart';
import 'package:child_goods_store_flutter/enums/product_status.dart';
import 'package:child_goods_store_flutter/enums/search_range.dart';
import 'package:child_goods_store_flutter/enums/sub_category.dart';
import 'package:child_goods_store_flutter/interceptors/auth_interceptor.dart';
import 'package:child_goods_store_flutter/interceptors/un_auth_interceptor.dart';
import 'package:child_goods_store_flutter/main_prod.dart';
import 'package:child_goods_store_flutter/models/product/product_model.dart';
import 'package:child_goods_store_flutter/models/product/product_preview_model.dart';
import 'package:child_goods_store_flutter/models/res/res_model.dart';
import 'package:child_goods_store_flutter/models/user/user_profile_model.dart';
import 'package:child_goods_store_flutter/utils/mock_dio_exception.dart';
import 'package:dio/dio.dart';

class ProductRepository {
  Future<ResModel<List<ProductPreviewModel>>> getProductList({
    required ESearchRange region,
    EMainCategory? mainCategory,
    ESubCategory? subCategory,
    EChildAge? age,
    EChildGender? gender,
    int? minPrice,
    int? maxPrice,
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
    if (minPrice != null) {
      queryParams['minPrice'] = minPrice;
    }
    if (maxPrice != null) {
      queryParams['maxPrice'] = maxPrice;
    }

    // Dio dio = Dio();
    // dio.interceptors.add(UnAuthInterceptor());
    // dio.get(
    //   '/product',
    //   queryParameters: queryParams,
    // );

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<List<ProductPreviewModel>>(
      code: 1000,
      data: [
        for (var productId in List.generate(10, (index) => index + 1))
          ProductPreviewModel(
            productId: productId,
            productName: '$productId th product',
            price: 12000,
            state: EProductSaleStatus.sale,
            productImage: productId % 3 == 0
                ? ''
                : 'https://lh4.googleusercontent.com/on7Yj1rShJRRBy88rTmptLVzMI4gEBDBabmSMv-GGsPIo5umfS5dpSJp3b4EoqKtnxdOYXeHSyct6m2fLYKckaikrUJn91PNWkIYXtkrCljcvdEnGdf_nQM5Qw6bQY4q6jvbWiBcC3WPTIcDS_lizv3R25oVAF_H0PNzvRo7JivPSiZR',
            productHeart: productId % 3 == 0 ? false : true,
          ),
      ],
    ).toJson(
      (products) => products.map((prod) => prod.toJson()).toList(),
    );

    var res = ResModel<List<ProductPreviewModel>>.fromJson(
      resTmp,
      (json) => (json as List<dynamic>)
          .map((prod) => ProductPreviewModel.fromJson(prod))
          .toList(),
    );

    return res;
  }

  Future<ResModel<ProductModel>> getProduct({
    required int productId,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(UnAuthInterceptor());
    // dio.get('/product/$productId');

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<ProductModel>(
      code: 1000,
      data: ProductModel(
        productId: productId,
        user: UserProfileModel(
          userId: 1, // 분기
          nickName: 'product $productId saler',
          averageStars: 4.5,
        ),
        productName: '$productId th product',
        price: 12000,
        content: '$productId th product contents',
        productStatus: EProductStatus.littleUsage,
        state: EProductSaleStatus.sale,
        createAt: DateTime.now(),
        updateAt: DateTime.now(),
        tag: List.generate(3, (index) => '$productId-$index tag'),
        productImage: [
          'https://lh4.googleusercontent.com/on7Yj1rShJRRBy88rTmptLVzMI4gEBDBabmSMv-GGsPIo5umfS5dpSJp3b4EoqKtnxdOYXeHSyct6m2fLYKckaikrUJn91PNWkIYXtkrCljcvdEnGdf_nQM5Qw6bQY4q6jvbWiBcC3WPTIcDS_lizv3R25oVAF_H0PNzvRo7JivPSiZR',
          'https://lh4.googleusercontent.com/on7Yj1rShJRRBy88rTmptLVzMI4gEBDBabmSMv-GGsPIo5umfS5dpSJp3b4EoqKtnxdOYXeHSyct6m2fLYKckaikrUJn91PNWkIYXtkrCljcvdEnGdf_nQM5Qw6bQY4q6jvbWiBcC3WPTIcDS_lizv3R25oVAF_H0PNzvRo7JivPSiZR',
          'https://lh4.googleusercontent.com/on7Yj1rShJRRBy88rTmptLVzMI4gEBDBabmSMv-GGsPIo5umfS5dpSJp3b4EoqKtnxdOYXeHSyct6m2fLYKckaikrUJn91PNWkIYXtkrCljcvdEnGdf_nQM5Qw6bQY4q6jvbWiBcC3WPTIcDS_lizv3R25oVAF_H0PNzvRo7JivPSiZR',
        ],
        productHeart: false,
      ),
    ).toJson((product) => product.toJson());

    var res = ResModel<ProductModel>.fromJson(
      resTmp,
      (json) => ProductModel.fromJson(json),
    );

    return res;
  }

  Future<ResModel<void>> postProductStatus({
    required int productId,
    required EProductSaleStatus status,
    int? saledUserId,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // dio.post(
    //   '/product/status/$productId',
    //   data: {
    //     'status': status.key,
    //     'userId': saledUserId ?? -1,
    //   },
    // );

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel(code: 1000).toJson((p0) => null);

    var res = ResModel.fromJson(resTmp, (json) => null);

    return res;
  }

  Future<ResModel<void>> postProductHeart({
    required int productId,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // dio.post('/product/heart/$productId');

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel(code: 1000).toJson((p0) => null);

    var res = ResModel.fromJson(resTmp, (json) => null);

    return res;
  }

  Future<ResModel<void>> deleteProductHeart({
    required int productId,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // dio.delete('/product/heart/$productId');

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel(code: 1000).toJson((p0) => null);

    var res = ResModel.fromJson(resTmp, (json) => null);

    return res;
  }

  Future<ResModel<List<UserProfileModel>>> getProductBuyer({
    required int productId,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // dio.get('/product/buyer/$productId');

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<List<UserProfileModel>>(
      code: 1000,
      data: [
        UserProfileModel(
          userId: 100,
          profileImg:
              'https://lh4.googleusercontent.com/on7Yj1rShJRRBy88rTmptLVzMI4gEBDBabmSMv-GGsPIo5umfS5dpSJp3b4EoqKtnxdOYXeHSyct6m2fLYKckaikrUJn91PNWkIYXtkrCljcvdEnGdf_nQM5Qw6bQY4q6jvbWiBcC3WPTIcDS_lizv3R25oVAF_H0PNzvRo7JivPSiZR',
          nickName: '구매자1',
        ),
        UserProfileModel(
          userId: 101,
          profileImg: '',
          nickName: '구매자2',
        ),
        UserProfileModel(
          userId: 102,
          nickName: '구매자3',
        ),
      ],
    ).toJson(
      (users) => users.map((user) => user.toJson()).toList(),
    );

    var res = ResModel<List<UserProfileModel>>.fromJson(
      resTmp,
      (json) => (json as List<dynamic>)
          .map((user) => UserProfileModel.fromJson(user))
          .toList(),
    );

    return res;
  }
}
