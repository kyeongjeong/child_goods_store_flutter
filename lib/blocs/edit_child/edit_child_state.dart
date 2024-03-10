import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/child/child_model.dart';
import 'package:image_picker/image_picker.dart';

class EditChildState extends BlocState {
  final ChildModel child;
  final XFile? image;
  final bool removeImage;

  const EditChildState({
    required this.child,
    required this.image,
    required this.removeImage,
    required super.status,
    super.message,
  });

  EditChildState.init({ChildModel? child})
      : child = child ?? ChildModel(),
        image = null,
        removeImage = false,
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  EditChildState copyWith({
    ChildModel? child,
    XFile? image,
    bool? removeImage,
    ELoadingStatus? status,
    String? message,
  }) =>
      EditChildState(
        child: child ?? this.child,
        image: image ?? this.image,
        removeImage: removeImage ?? this.removeImage,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        child,
        image,
        removeImage,
        status,
        message,
      ];
}
