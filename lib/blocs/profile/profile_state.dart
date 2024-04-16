import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/user/user_profile_model.dart';

class ProfileState extends BlocState {
  final ELoadingStatus profileStatus;
  final UserProfileModel? userProfile;
  final ELoadingStatus followStatus;

  const ProfileState({
    required this.profileStatus,
    this.userProfile,
    required this.followStatus,
    required super.status,
    super.message,
  });

  const ProfileState.init()
      : profileStatus = ELoadingStatus.init,
        userProfile = null,
        followStatus = ELoadingStatus.init,
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  ProfileState copyWith({
    ELoadingStatus? profileStatus,
    UserProfileModel? userProfile,
    ELoadingStatus? followStatus,
    ELoadingStatus? status,
    String? message,
  }) =>
      ProfileState(
        profileStatus: profileStatus ?? this.profileStatus,
        userProfile: userProfile ?? this.userProfile,
        followStatus: followStatus ?? this.followStatus,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        profileStatus,
        userProfile,
        followStatus,
        status,
        message,
      ];
}
