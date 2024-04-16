import 'package:child_goods_store_flutter/enums/chat_item_type.dart';
import 'package:child_goods_store_flutter/interceptors/auth_interceptor.dart';
import 'package:child_goods_store_flutter/interceptors/un_auth_interceptor.dart';
import 'package:child_goods_store_flutter/models/res/res_model.dart';
import 'package:child_goods_store_flutter/models/review/review_model.dart';
import 'package:child_goods_store_flutter/utils/mock_dio_exception.dart';
import 'package:dio/dio.dart';

class ReviewRepository {
  ///
  /// API 14
  Future<ResModel<List<ReviewModel>>> getReviewList({
    required int userId,
    required int page,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(UnAuthInterceptor());
    // dio.get(
    //   '/review/$userId',
    //   queryParameters: {
    //     'page': page,
    //   },
    // );

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel<List<ReviewModel>>(
      code: 1000,
      data: [
        for (var reviewId in List.generate(10, (index) => index + 1))
          ReviewModel(
            reviewId: reviewId,
            id: reviewId + 1,
            type: reviewId % 2 == 0
                ? EChatItemType.product
                : EChatItemType.together,
            userId: reviewId,
            name: '$reviewId th item',
            userName: '$reviewId reviewer',
            averageStars: 4.3,
            totalReview: 10,
            score: reviewId % 5,
            content: '$reviewId th item\'s review',
            createdAt: DateTime.now(),
          ),
      ],
    ).toJson(
      (reviews) => reviews.map((prod) => prod.toJson()).toList(),
    );

    var res = ResModel<List<ReviewModel>>.fromJson(
      resTmp,
      (json) => (json as List<dynamic>)
          .map((review) => ReviewModel.fromJson(review))
          .toList(),
    );

    return res;
  }

  ///
  /// API 15
  Future<ResModel<void>> postReview({
    required ReviewModel review,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // dio.post(
    //   '/review',
    //   data: review.toJson(),
    // );

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel(code: 1000).toJson((p0) => null);

    var res = ResModel.fromJson(resTmp, (json) => null);

    return res;
  }

  ///
  /// API 16
  Future<ResModel<void>> patchReview({
    required ReviewModel review,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // dio.patch(
    //   '/review/${review.reviewId}',
    //   data: review.toJson(),
    // );

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel(code: 1000).toJson((p0) => null);

    var res = ResModel.fromJson(resTmp, (json) => null);

    return res;
  }

  ///
  /// API 22
  Future<ResModel<void>> deleteReview({
    required int reviewId,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    // dio.delete('/review/$reviewId');

    // TODO: connect api
    await Future.delayed(const Duration(seconds: 1));

    var resTmp = ResModel(code: 1000).toJson((p0) => null);

    var res = ResModel.fromJson(resTmp, (json) => null);

    return res;
  }
}
