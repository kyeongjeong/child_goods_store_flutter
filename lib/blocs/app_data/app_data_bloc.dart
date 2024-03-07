import 'dart:convert';
import 'package:child_goods_store_flutter/blocs/app_data/app_data_event.dart';
import 'package:child_goods_store_flutter/blocs/app_data/app_data_state.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDataBloc extends Bloc<AppDataEvent, AppDataState> {
  AppDataBloc() : super(AppDataState.init()) {
    on<AppDataReset>(_appDataResetHandler);
    on<AppDataLoadAdminDistrict>(_appDataLoadAdminDistrictHandler);
  }

  Future<void> _appDataResetHandler(
    AppDataReset event,
    Emitter<AppDataState> emit,
  ) async {
    emit(AppDataState.init());
  }

  Future<void> _appDataLoadAdminDistrictHandler(
    AppDataLoadAdminDistrict event,
    Emitter<AppDataState> emit,
  ) async {
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

    emit(state.copyWith(region: districtData));
  }
}
