import 'package:equatable/equatable.dart';

class GoRouterExtraModel<T> extends Equatable {
  final bool? popAble;
  final T? data;

  const GoRouterExtraModel({
    this.popAble,
    this.data,
  });

  @override
  List<Object?> get props => [
        popAble,
        data,
      ];
}
