// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) {
  return _UserProfileModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfileModel {
  int? get userIdx => throw _privateConstructorUsedError;
  String? get nickName => throw _privateConstructorUsedError;
  String? get introduce => throw _privateConstructorUsedError;
  String? get profileImg => throw _privateConstructorUsedError;
  int? get followNum => throw _privateConstructorUsedError;
  int? get followingNum => throw _privateConstructorUsedError;
  double? get averageStars => throw _privateConstructorUsedError;
  DateTime? get createAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileModelCopyWith<UserProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileModelCopyWith<$Res> {
  factory $UserProfileModelCopyWith(
          UserProfileModel value, $Res Function(UserProfileModel) then) =
      _$UserProfileModelCopyWithImpl<$Res, UserProfileModel>;
  @useResult
  $Res call(
      {int? userIdx,
      String? nickName,
      String? introduce,
      String? profileImg,
      int? followNum,
      int? followingNum,
      double? averageStars,
      DateTime? createAt});
}

/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res, $Val extends UserProfileModel>
    implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userIdx = freezed,
    Object? nickName = freezed,
    Object? introduce = freezed,
    Object? profileImg = freezed,
    Object? followNum = freezed,
    Object? followingNum = freezed,
    Object? averageStars = freezed,
    Object? createAt = freezed,
  }) {
    return _then(_value.copyWith(
      userIdx: freezed == userIdx
          ? _value.userIdx
          : userIdx // ignore: cast_nullable_to_non_nullable
              as int?,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      introduce: freezed == introduce
          ? _value.introduce
          : introduce // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImg: freezed == profileImg
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
      followNum: freezed == followNum
          ? _value.followNum
          : followNum // ignore: cast_nullable_to_non_nullable
              as int?,
      followingNum: freezed == followingNum
          ? _value.followingNum
          : followingNum // ignore: cast_nullable_to_non_nullable
              as int?,
      averageStars: freezed == averageStars
          ? _value.averageStars
          : averageStars // ignore: cast_nullable_to_non_nullable
              as double?,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileModelImplCopyWith<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  factory _$$UserProfileModelImplCopyWith(_$UserProfileModelImpl value,
          $Res Function(_$UserProfileModelImpl) then) =
      __$$UserProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? userIdx,
      String? nickName,
      String? introduce,
      String? profileImg,
      int? followNum,
      int? followingNum,
      double? averageStars,
      DateTime? createAt});
}

/// @nodoc
class __$$UserProfileModelImplCopyWithImpl<$Res>
    extends _$UserProfileModelCopyWithImpl<$Res, _$UserProfileModelImpl>
    implements _$$UserProfileModelImplCopyWith<$Res> {
  __$$UserProfileModelImplCopyWithImpl(_$UserProfileModelImpl _value,
      $Res Function(_$UserProfileModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userIdx = freezed,
    Object? nickName = freezed,
    Object? introduce = freezed,
    Object? profileImg = freezed,
    Object? followNum = freezed,
    Object? followingNum = freezed,
    Object? averageStars = freezed,
    Object? createAt = freezed,
  }) {
    return _then(_$UserProfileModelImpl(
      userIdx: freezed == userIdx
          ? _value.userIdx
          : userIdx // ignore: cast_nullable_to_non_nullable
              as int?,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      introduce: freezed == introduce
          ? _value.introduce
          : introduce // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImg: freezed == profileImg
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
      followNum: freezed == followNum
          ? _value.followNum
          : followNum // ignore: cast_nullable_to_non_nullable
              as int?,
      followingNum: freezed == followingNum
          ? _value.followingNum
          : followingNum // ignore: cast_nullable_to_non_nullable
              as int?,
      averageStars: freezed == averageStars
          ? _value.averageStars
          : averageStars // ignore: cast_nullable_to_non_nullable
              as double?,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileModelImpl implements _UserProfileModel {
  _$UserProfileModelImpl(
      {this.userIdx,
      this.nickName,
      this.introduce,
      this.profileImg,
      this.followNum,
      this.followingNum,
      this.averageStars,
      this.createAt});

  factory _$UserProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileModelImplFromJson(json);

  @override
  final int? userIdx;
  @override
  final String? nickName;
  @override
  final String? introduce;
  @override
  final String? profileImg;
  @override
  final int? followNum;
  @override
  final int? followingNum;
  @override
  final double? averageStars;
  @override
  final DateTime? createAt;

  @override
  String toString() {
    return 'UserProfileModel(userIdx: $userIdx, nickName: $nickName, introduce: $introduce, profileImg: $profileImg, followNum: $followNum, followingNum: $followingNum, averageStars: $averageStars, createAt: $createAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileModelImpl &&
            (identical(other.userIdx, userIdx) || other.userIdx == userIdx) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.introduce, introduce) ||
                other.introduce == introduce) &&
            (identical(other.profileImg, profileImg) ||
                other.profileImg == profileImg) &&
            (identical(other.followNum, followNum) ||
                other.followNum == followNum) &&
            (identical(other.followingNum, followingNum) ||
                other.followingNum == followingNum) &&
            (identical(other.averageStars, averageStars) ||
                other.averageStars == averageStars) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userIdx, nickName, introduce,
      profileImg, followNum, followingNum, averageStars, createAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith =>
      __$$UserProfileModelImplCopyWithImpl<_$UserProfileModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileModelImplToJson(
      this,
    );
  }
}

abstract class _UserProfileModel implements UserProfileModel {
  factory _UserProfileModel(
      {final int? userIdx,
      final String? nickName,
      final String? introduce,
      final String? profileImg,
      final int? followNum,
      final int? followingNum,
      final double? averageStars,
      final DateTime? createAt}) = _$UserProfileModelImpl;

  factory _UserProfileModel.fromJson(Map<String, dynamic> json) =
      _$UserProfileModelImpl.fromJson;

  @override
  int? get userIdx;
  @override
  String? get nickName;
  @override
  String? get introduce;
  @override
  String? get profileImg;
  @override
  int? get followNum;
  @override
  int? get followingNum;
  @override
  double? get averageStars;
  @override
  DateTime? get createAt;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
