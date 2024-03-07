import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';

class AppDataState extends BlocState {
  final Map<String, List<String>> region;

  const AppDataState({
    required this.region,
    required super.status,
    super.message,
  });

  AppDataState.init()
      : region = {},
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  AppDataState copyWith({
    ELoadingStatus? status,
    String? message,
    Map<String, List<String>>? region,
  }) =>
      AppDataState(
        region: region ?? this.region,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        region,
        status,
        message,
      ];
}
