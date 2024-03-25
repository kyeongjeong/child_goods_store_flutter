import 'package:child_goods_store_flutter/blocs/edit_child/edit_child_event.dart';
import 'package:child_goods_store_flutter/blocs/edit_child/edit_child_state.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/http_method.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/mixins/dio_exception_handler.dart';
import 'package:child_goods_store_flutter/models/child/child_model.dart';
import 'package:child_goods_store_flutter/models/res/res_model.dart';
import 'package:child_goods_store_flutter/repositories/child_repository.dart';
import 'package:child_goods_store_flutter/repositories/image_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditChildBloc extends Bloc<EditChildEvent, EditChildState>
    with DioExceptionHandlerMixin {
  final ChildRepository childRepository;
  final ImageRepository imageRepository;
  final EHttpMethod httpMethod;

  EditChildBloc({
    required this.childRepository,
    required this.imageRepository,
    required this.httpMethod,
    ChildModel? child,
  }) : super(EditChildState.init(child: child)) {
    on<EditChildChangeImage>(_editChildChangeImageHandler);
    on<EditChildChangeName>(_editChildChangeNameHandler);
    on<EditChildChangeGender>(_editChildChangeGenderHandler);
    on<EditChildChangeAge>(_editChildChangeAgeHandler);
    on<EditChildChangeTag>(_editChildChangeTagHandler);
    on<EditChildSubmit>(_editChildSubmitHandler);
  }

  Future<void> _editChildChangeImageHandler(
    EditChildChangeImage event,
    Emitter<EditChildState> emit,
  ) async {
    if (event.image != null) {
      emit(state.copyWith(
        image: event.image,
        removeImage: false,
      ));
    } else {
      emit(state.copyWith(removeImage: true));
    }
  }

  Future<void> _editChildChangeNameHandler(
    EditChildChangeName event,
    Emitter<EditChildState> emit,
  ) async {
    emit(state.copyWith(
      child: state.child.copyWith(
        name: event.name,
      ),
    ));
  }

  Future<void> _editChildChangeGenderHandler(
    EditChildChangeGender event,
    Emitter<EditChildState> emit,
  ) async {
    emit(state.copyWith(
      child: state.child.copyWith(
        gender: event.gender,
      ),
    ));
  }

  Future<void> _editChildChangeAgeHandler(
    EditChildChangeAge event,
    Emitter<EditChildState> emit,
  ) async {
    emit(state.copyWith(
      child: state.child.copyWith(
        age: event.age,
      ),
    ));
  }

  Future<void> _editChildChangeTagHandler(
    EditChildChangeTag event,
    Emitter<EditChildState> emit,
  ) async {
    emit(state.copyWith(
      child: state.child.copyWith(
        tag: event.tag,
      ),
    ));
  }

  Future<void> _editChildSubmitHandler(
    EditChildSubmit event,
    Emitter<EditChildState> emit,
  ) async {
    if (state.status == ELoadingStatus.loading) return;

    // Validate
    if (state.child.name == null || state.child.name == Strings.nullStr) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '자녀 이름을 입력해주세요.',
      ));
      emit(state.copyWith(status: ELoadingStatus.init));
      return;
    }
    if (state.child.gender == null) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '자녀 성별을 선택해주세요.',
      ));
      emit(state.copyWith(status: ELoadingStatus.init));
      return;
    }
    if (state.child.age == null) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '자녀 연령을 설정해주세요.',
      ));
      emit(state.copyWith(status: ELoadingStatus.init));
      return;
    }

    await handleApiRequest(
      () async {
        emit(state.copyWith(status: ELoadingStatus.loading));

        if (!state.removeImage && state.image != null) {
          var res = await imageRepository.postImage(image: state.image!);
          emit(state.copyWith(
            child: state.child.copyWith(
              childImg: res.data,
            ),
          ));
        }
        if (state.removeImage) {
          emit(state.copyWith(
            child: state.child.copyWith(
              childImg: Strings.nullStr,
            ),
          ));
        }

        ResModel<ChildModel>? res;
        switch (httpMethod) {
          case EHttpMethod.post:
            res = await childRepository.postChild(child: state.child);
            break;
          case EHttpMethod.patch:
            res = await childRepository.patchChild(child: state.child);
            break;
        }

        if (res.data == null) {
          emit(state.copyWith(
            status: ELoadingStatus.error,
            message: '저장에 실패했습니다.',
          ));
          emit(state.copyWith(status: ELoadingStatus.init));
          return;
        }

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          result: res.data,
        ));
      },
      state: state,
      emit: emit,
    );
  }
}
