import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/user/user_model.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileState extends BlocState {
  final UserModel user;
  final XFile? image;
  final bool removeImage;

  const EditProfileState({
    required this.user,
    required this.image,
    required this.removeImage,
    required super.status,
    super.message,
  });

  EditProfileState.init({UserModel? user})
      : user = user ?? UserModel(),
        image = null,
        removeImage = false,
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  EditProfileState copyWith({
    UserModel? user,
    XFile? image,
    bool? removeImage,
    ELoadingStatus? status,
    String? message,
  }) =>
      EditProfileState(
        user: user ?? this.user,
        image: image ?? this.image,
        removeImage: removeImage ?? this.removeImage,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        user,
        image,
        removeImage,
        status,
        message,
      ];
}
