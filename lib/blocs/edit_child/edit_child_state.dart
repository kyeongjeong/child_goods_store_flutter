import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/child/child_model.dart';
import 'package:image_picker/image_picker.dart';

class EditChildState extends BlocState {
  final ChildModel child;
  final XFile? image;
  final bool removeImage;
  final ChildModel? result;

  const EditChildState({
    required this.child,
    required this.image,
    required this.removeImage,
    this.result,
    required super.status,
    super.message,
  });

  EditChildState.init({ChildModel? child})
      : child = child ?? ChildModel(),
        image = null,
        removeImage = false,
        result = null,
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  EditChildState copyWith({
    ChildModel? child,
    XFile? image,
    bool? removeImage,
    ChildModel? result,
    ELoadingStatus? status,
    String? message,
  }) =>
      EditChildState(
        child: child ?? this.child,
        image: image ?? this.image,
        removeImage: removeImage ?? this.removeImage,
        result: result ?? this.result,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        child,
        image,
        removeImage,
        result,
        status,
        message,
      ];
}
