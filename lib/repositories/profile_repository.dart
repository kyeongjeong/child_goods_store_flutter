import 'package:child_goods_store_flutter/enums/chat_item_type.dart';
import 'package:child_goods_store_flutter/enums/product_sale_state.dart';
import 'package:child_goods_store_flutter/interceptors/auth_interceptor.dart';
import 'package:child_goods_store_flutter/interceptors/un_auth_interceptor.dart';
import 'package:child_goods_store_flutter/models/product/product_preview_model.dart';
import 'package:child_goods_store_flutter/models/res/res_model.dart';
import 'package:child_goods_store_flutter/models/purchase/purchase_model.dart';
import 'package:child_goods_store_flutter/models/together/together_preview_model.dart';
import 'package:dio/dio.dart';

class ProfileRepository {
  ///
  /// API 103
  Future<ResModel<List<ProductPreviewModel>>> getProfileProductList({
    required int userId,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(UnAuthInterceptor());
    // dio.get('/profile/product/$userId');

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
            state: EProductSaleState.sale,
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

  ///
  /// API 104
  Future<ResModel<List<ProductPreviewModel>>>
      getProfileProductHeartList() async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // dio.get('/profile/product/heart');

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
            state: EProductSaleState.sale,
            productImage: productId % 3 == 0
                ? ''
                : 'https://lh4.googleusercontent.com/on7Yj1rShJRRBy88rTmptLVzMI4gEBDBabmSMv-GGsPIo5umfS5dpSJp3b4EoqKtnxdOYXeHSyct6m2fLYKckaikrUJn91PNWkIYXtkrCljcvdEnGdf_nQM5Qw6bQY4q6jvbWiBcC3WPTIcDS_lizv3R25oVAF_H0PNzvRo7JivPSiZR',
            productHeart: true,
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

  ///
  /// API 105
  Future<ResModel<List<PurchaseModel>>> getProfileProductPurchaseList() async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // dio.get('/profile/product/purchase');

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<List<PurchaseModel>>(
      code: 1000,
      data: [
        for (var productId in List.generate(10, (index) => index + 1))
          PurchaseModel(
            category: EChatItemType.product,
            id: productId,
            name: '$productId name',
            sellerName: '$productId saller name',
            price: 10000,
            saleCompleteDate: DateTime.now(),
            isReview: productId % 3 == 0 ? false : true,
          ),
      ],
    ).toJson(
      (products) => products.map((prod) => prod.toJson()).toList(),
    );

    var res = ResModel<List<PurchaseModel>>.fromJson(
      resTmp,
      (json) => (json as List<dynamic>)
          .map((prod) => PurchaseModel.fromJson(prod))
          .toList(),
    );

    return res;
  }

  ///
  /// API 202
  Future<ResModel<List<TogetherPreviewModel>>> getProfileTogetherList({
    required int userId,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(UnAuthInterceptor());
    // dio.get('/profile/together/$userId');

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<List<TogetherPreviewModel>>(
      code: 1000,
      data: [
        for (var togetherId in List.generate(10, (index) => index + 1))
          TogetherPreviewModel(
            togetherId: togetherId,
            togetherName: '$togetherId th Together',
            totalPrice: 120000,
            purchasePrice: 1200,
            totalNum: 100,
            purchaseNum: 6 * togetherId,
            deadline: DateTime.now(),
            togetherImage: togetherId % 3 == 0
                ? ''
                : 'https://lh4.googleusercontent.com/on7Yj1rShJRRBy88rTmptLVzMI4gEBDBabmSMv-GGsPIo5umfS5dpSJp3b4EoqKtnxdOYXeHSyct6m2fLYKckaikrUJn91PNWkIYXtkrCljcvdEnGdf_nQM5Qw6bQY4q6jvbWiBcC3WPTIcDS_lizv3R25oVAF_H0PNzvRo7JivPSiZR',
            togetherHeart: togetherId % 3 == 0 ? false : true,
          ),
      ],
    ).toJson(
      (togethers) => togethers.map((tgd) => tgd.toJson()).toList(),
    );

    var res = ResModel<List<TogetherPreviewModel>>.fromJson(
      resTmp,
      (json) => (json as List<dynamic>)
          .map((prod) => TogetherPreviewModel.fromJson(prod))
          .toList(),
    );

    return res;
  }

  ///
  /// API 203
  Future<ResModel<List<TogetherPreviewModel>>>
      getProfileTogetherHeartList() async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // dio.get('/profile/together/heart');

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<List<TogetherPreviewModel>>(
      code: 1000,
      data: [
        for (var togetherId in List.generate(10, (index) => index + 1))
          TogetherPreviewModel(
            togetherId: togetherId,
            togetherName: '$togetherId th Together',
            totalPrice: 120000,
            purchasePrice: 1200,
            totalNum: 100,
            purchaseNum: 6 * togetherId,
            deadline: DateTime.now(),
            togetherImage: togetherId % 3 == 0
                ? ''
                : 'https://lh4.googleusercontent.com/on7Yj1rShJRRBy88rTmptLVzMI4gEBDBabmSMv-GGsPIo5umfS5dpSJp3b4EoqKtnxdOYXeHSyct6m2fLYKckaikrUJn91PNWkIYXtkrCljcvdEnGdf_nQM5Qw6bQY4q6jvbWiBcC3WPTIcDS_lizv3R25oVAF_H0PNzvRo7JivPSiZR',
            togetherHeart: true,
          ),
      ],
    ).toJson(
      (togethers) => togethers.map((tgd) => tgd.toJson()).toList(),
    );

    var res = ResModel<List<TogetherPreviewModel>>.fromJson(
      resTmp,
      (json) => (json as List<dynamic>)
          .map((prod) => TogetherPreviewModel.fromJson(prod))
          .toList(),
    );

    return res;
  }

  ///
  /// API 204
  Future<ResModel<List<PurchaseModel>>> getProfileTogetherPurchaseList() async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // dio.get('/profile/together/purchase');

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<List<PurchaseModel>>(
      code: 1000,
      data: [
        for (var togetherId in List.generate(10, (index) => index + 1))
          PurchaseModel(
            category: EChatItemType.together,
            id: togetherId,
            name: '$togetherId name',
            sellerName: '$togetherId saller name',
            price: 10000,
            saleCompleteDate: DateTime.now(),
            isReview: togetherId % 3 == 0 ? false : true,
          ),
      ],
    ).toJson(
      (products) => products.map((prod) => prod.toJson()).toList(),
    );

    var res = ResModel<List<PurchaseModel>>.fromJson(
      resTmp,
      (json) => (json as List<dynamic>)
          .map((prod) => PurchaseModel.fromJson(prod))
          .toList(),
    );

    return res;
  }
}
