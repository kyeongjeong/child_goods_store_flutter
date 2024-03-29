import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/together/together_model.dart';

class TogetherDetailState extends BlocState {
  final TogetherModel? together;
  final ELoadingStatus togetherStatus;
  final ELoadingStatus heartStatus;

  const TogetherDetailState({
    this.together,
    required this.togetherStatus,
    required this.heartStatus,
    required super.status,
    super.message,
  });

  const TogetherDetailState.init()
      : together = null,
        togetherStatus = ELoadingStatus.init,
        heartStatus = ELoadingStatus.init,
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  TogetherDetailState copyWith({
    ELoadingStatus? status,
    String? message,
    TogetherModel? together,
    ELoadingStatus? togetherStatus,
    ELoadingStatus? heartStatus,
  }) =>
      TogetherDetailState(
        status: status ?? this.status,
        message: message ?? this.message,
        together: together ?? this.together,
        togetherStatus: togetherStatus ?? this.togetherStatus,
        heartStatus: heartStatus ?? this.heartStatus,
      );

  @override
  List<Object?> get props => [
        status,
        message,
        together,
        togetherStatus,
        heartStatus,
      ];
}
