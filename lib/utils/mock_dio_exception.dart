import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/models/res/res_model.dart';
import 'package:dio/dio.dart';

void mockThrowDioError({
  required ResModel<void> errorModel,
}) {
  throw DioException.connectionError(
    requestOptions: RequestOptions(),
    reason: errorModel.message ?? Strings.unknownFail,
    error: ResModel(
      code: errorModel.code,
      message: errorModel.message,
    ),
  );
}
