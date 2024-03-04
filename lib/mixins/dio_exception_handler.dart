import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/res/res_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin DioExceptionHandlerMixin {
  Future<void> handleApiRequest(
    Future<void> Function() apiCall, {
    Future<void> Function()? finallyCall,
    required BlocState state,
    required Emitter<BlocState> emit,
  }) async {
    try {
      await apiCall();
    } on DioException catch (e) {
      var error = e.error as ResModel<void>;
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '[${error.code}] ${error.message ?? Strings.unknownFail}',
      ));
      debugPrint('[DioExceptionHandlerMixin/DioException] ${error.message}');
    } catch (e) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '[5001] ${e.toString().replaceAll('Exception: ', '')}',
      ));
      debugPrint('[DioExceptionHandlerMixin/Exception] ${e.toString()}');
    } finally {
      await finallyCall?.call();
    }
  }
}
