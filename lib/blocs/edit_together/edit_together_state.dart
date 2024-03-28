import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/together/together_model.dart';
import 'package:image_picker/image_picker.dart';

class EditTogetherState extends BlocState {
  final TogetherModel together;
  final List<XFile> newImage;
  final int? result;

  const EditTogetherState({
    required this.together,
    required this.newImage,
    this.result,
    required super.status,
    super.message,
  });

  EditTogetherState.init({TogetherModel? together})
      : together = together ?? TogetherModel(),
        newImage = const [],
        result = null,
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  EditTogetherState copyWith({
    ELoadingStatus? status,
    String? message,
    TogetherModel? together,
    List<XFile>? newImage,
    int? result,
  }) =>
      EditTogetherState(
        together: together ?? this.together,
        newImage: newImage ?? this.newImage,
        result: result ?? this.result,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        together,
        newImage,
        result,
        status,
        message,
      ];
}
