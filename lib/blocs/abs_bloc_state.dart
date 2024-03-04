import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:equatable/equatable.dart';

abstract class BlocState extends Equatable {
  final ELoadingStatus status;
  final String? message;

  const BlocState({
    required this.status,
    this.message,
  });

  BlocState copyWith({
    ELoadingStatus? status,
    String? message,
  });
}
