import 'package:child_goods_store_flutter/blocs/child/child_event.dart';
import 'package:child_goods_store_flutter/blocs/child/child_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/mixins/dio_exception_handler.dart';
import 'package:child_goods_store_flutter/models/child/child_model.dart';
import 'package:child_goods_store_flutter/repositories/child_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChildBloc extends Bloc<ChildEvent, ChildState>
    with DioExceptionHandlerMixin {
  final ChildRepository childRepository;

  ChildBloc({
    required this.childRepository,
  }) : super(const ChildState.init()) {
    on<ChildGetChildren>(_childGetChildrenHandler);
    on<ChildAdd>(_childAddHandler);
    on<ChildEdit>(_childEditHandler);
    on<ChildSelect>(_childSelectHandler);

    add(ChildGetChildren());
  }

  Future<void> _childGetChildrenHandler(
    ChildGetChildren event,
    Emitter<ChildState> emit,
  ) async {
    if (state.status == ELoadingStatus.loading &&
        state.childListState == ELoadingStatus.loading) return;

    emit(state.copyWith(
      status: ELoadingStatus.loading,
      childListState: ELoadingStatus.loading,
    ));
    await handleApiRequest(
      () async {
        var res = await childRepository.getChild();

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          childListState: ELoadingStatus.loaded,
          childList: res.data,
        ));

        if (res.data?.isNotEmpty == true) {
          add(ChildSelect(res.data!.first.childId!));
        }
      },
      state: state,
      emit: emit,
      initAfterError: false,
    );
  }

  Future<void> _childSelectHandler(
    ChildSelect event,
    Emitter<ChildState> emit,
  ) async {
    if (state.childList.isEmpty) return;

    var selectedChild = state.childList.singleWhere(
      (child) => child.childId == event.childId,
      orElse: () => ChildModel(childId: -1),
    );

    if (selectedChild.childId != -1) {
      emit(state.copyWith(selectedChild: selectedChild));
    } else {
      emit(state.copyWith(nullSelectedChild: true));
    }
  }

  Future<void> _childAddHandler(
    ChildAdd event,
    Emitter<ChildState> emit,
  ) async {}

  Future<void> _childEditHandler(
    ChildEdit event,
    Emitter<ChildState> emit,
  ) async {}
}
