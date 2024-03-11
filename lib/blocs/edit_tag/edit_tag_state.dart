import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';

class EditTagState extends BlocState {
  final List<String> tags;
  final List<String> queryResult;
  final String? query;

  const EditTagState({
    required this.tags,
    required this.queryResult,
    this.query,
    required super.status,
    super.message,
  });

  const EditTagState.init({List<String>? tags})
      : tags = tags ?? const [],
        queryResult = const [],
        query = null,
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  EditTagState copyWith({
    List<String>? tags,
    List<String>? queryResult,
    String? query,
    ELoadingStatus? status,
    String? message,
  }) =>
      EditTagState(
        tags: tags ?? this.tags,
        queryResult: queryResult ?? this.queryResult,
        query: query ?? this.query,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        tags,
        queryResult,
        query,
        status,
        message,
      ];
}
