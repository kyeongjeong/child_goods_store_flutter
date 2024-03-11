import 'package:equatable/equatable.dart';

class GoRouterExtraModel<T> extends Equatable {
  final bool? refreshWhenPop;
  final T? data;

  const GoRouterExtraModel({
    this.refreshWhenPop,
    this.data,
  });

  @override
  List<Object?> get props => [
        refreshWhenPop,
        data,
      ];
}
