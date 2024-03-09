import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/user/user_profile_model.dart';

class ProfileState extends BlocState {
  final ELoadingStatus profileStatus;
  final UserProfileModel? userProfile;

  const ProfileState({
    required this.profileStatus,
    this.userProfile,
    required super.status,
    super.message,
  });

  const ProfileState.init()
      : profileStatus = ELoadingStatus.init,
        userProfile = null,
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  ProfileState copyWith({
    ELoadingStatus? profileStatus,
    UserProfileModel? userProfile,
    ELoadingStatus? status,
    String? message,
  }) =>
      ProfileState(
        profileStatus: profileStatus ?? this.profileStatus,
        userProfile: userProfile ?? this.userProfile,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        profileStatus,
        userProfile,
        status,
        message,
      ];
}
