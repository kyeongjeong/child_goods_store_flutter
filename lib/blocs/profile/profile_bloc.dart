import 'package:child_goods_store_flutter/blocs/auth/auth_bloc_singleton.dart';
import 'package:child_goods_store_flutter/blocs/profile/profile_event.dart';
import 'package:child_goods_store_flutter/blocs/profile/profile_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/mixins/dio_exception_handler.dart';
import 'package:child_goods_store_flutter/models/res/res_model.dart';
import 'package:child_goods_store_flutter/models/user/user_profile_model.dart';
import 'package:child_goods_store_flutter/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState>
    with DioExceptionHandlerMixin {
  final UserRepository userRepository;
  final int userId;

  ProfileBloc({
    required this.userRepository,
    required this.userId,
  }) : super(const ProfileState.init()) {
    on<ProfileGet>(_profileGetHandler);

    add(ProfileGet());
  }

  Future<void> _profileGetHandler(
    ProfileGet event,
    Emitter<ProfileState> emit,
  ) async {
    if (state.status == ELoadingStatus.loading &&
        state.profileStatus == ELoadingStatus.loading) return;

    emit(state.copyWith(
      status: ELoadingStatus.loading,
      profileStatus: ELoadingStatus.loading,
    ));
    await handleApiRequest(
      () async {
        ResModel<UserProfileModel>? res;
        if (userId == AuthBlocSingleton.bloc.state.user?.userId) {
          res = await userRepository.getMyProfile();
        } else {
          res = await userRepository.getUserProfile(userId: userId);
        }

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          profileStatus: ELoadingStatus.loaded,
          userProfile: res.data,
        ));
      },
      state: state,
      emit: emit,
      initAfterError: false,
    );
  }
}
