import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/child/child_model.dart';

class ChildState extends BlocState {
  final ELoadingStatus childListState;
  final List<ChildModel> childList;
  final ChildModel? selectedChild;

  const ChildState({
    required this.childListState,
    required this.childList,
    this.selectedChild,
    required super.status,
    super.message,
  });

  const ChildState.init()
      : childListState = ELoadingStatus.init,
        childList = const [],
        selectedChild = null,
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  ChildState copyWith({
    ELoadingStatus? childListState,
    List<ChildModel>? childList,
    ChildModel? selectedChild,
    ELoadingStatus? status,
    String? message,
    bool nullSelectedChild = false,
  }) =>
      ChildState(
        childListState: childListState ?? this.childListState,
        childList: childList ?? this.childList,
        selectedChild:
            nullSelectedChild ? null : (selectedChild ?? this.selectedChild),
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        childListState,
        childList,
        selectedChild,
        status,
        message,
      ];
}
