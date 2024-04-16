// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) {
  return _ReviewModel.fromJson(json);
}

/// @nodoc
mixin _$ReviewModel {
  int? get reviewId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: EChatItemType.fromJson, toJson: EChatItemType.toJson)
  EChatItemType? get type => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  String? get userImage => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  double? get averageStars => throw _privateConstructorUsedError;
  int? get totalReview => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewModelCopyWith<ReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewModelCopyWith<$Res> {
  factory $ReviewModelCopyWith(
          ReviewModel value, $Res Function(ReviewModel) then) =
      _$ReviewModelCopyWithImpl<$Res, ReviewModel>;
  @useResult
  $Res call(
      {int? reviewId,
      @JsonKey(fromJson: EChatItemType.fromJson, toJson: EChatItemType.toJson)
      EChatItemType? type,
      int? id,
      int? userId,
      String? userImage,
      String? userName,
      double? averageStars,
      int? totalReview,
      int? score,
      String? content,
      DateTime? createdAt,
      String? name});
}

/// @nodoc
class _$ReviewModelCopyWithImpl<$Res, $Val extends ReviewModel>
    implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = freezed,
    Object? type = freezed,
    Object? id = freezed,
    Object? userId = freezed,
    Object? userImage = freezed,
    Object? userName = freezed,
    Object? averageStars = freezed,
    Object? totalReview = freezed,
    Object? score = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      reviewId: freezed == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EChatItemType?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      userImage: freezed == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      averageStars: freezed == averageStars
          ? _value.averageStars
          : averageStars // ignore: cast_nullable_to_non_nullable
              as double?,
      totalReview: freezed == totalReview
          ? _value.totalReview
          : totalReview // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewModelImplCopyWith<$Res>
    implements $ReviewModelCopyWith<$Res> {
  factory _$$ReviewModelImplCopyWith(
          _$ReviewModelImpl value, $Res Function(_$ReviewModelImpl) then) =
      __$$ReviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? reviewId,
      @JsonKey(fromJson: EChatItemType.fromJson, toJson: EChatItemType.toJson)
      EChatItemType? type,
      int? id,
      int? userId,
      String? userImage,
      String? userName,
      double? averageStars,
      int? totalReview,
      int? score,
      String? content,
      DateTime? createdAt,
      String? name});
}

/// @nodoc
class __$$ReviewModelImplCopyWithImpl<$Res>
    extends _$ReviewModelCopyWithImpl<$Res, _$ReviewModelImpl>
    implements _$$ReviewModelImplCopyWith<$Res> {
  __$$ReviewModelImplCopyWithImpl(
      _$ReviewModelImpl _value, $Res Function(_$ReviewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = freezed,
    Object? type = freezed,
    Object? id = freezed,
    Object? userId = freezed,
    Object? userImage = freezed,
    Object? userName = freezed,
    Object? averageStars = freezed,
    Object? totalReview = freezed,
    Object? score = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ReviewModelImpl(
      reviewId: freezed == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EChatItemType?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      userImage: freezed == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      averageStars: freezed == averageStars
          ? _value.averageStars
          : averageStars // ignore: cast_nullable_to_non_nullable
              as double?,
      totalReview: freezed == totalReview
          ? _value.totalReview
          : totalReview // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewModelImpl implements _ReviewModel {
  _$ReviewModelImpl(
      {this.reviewId,
      @JsonKey(fromJson: EChatItemType.fromJson, toJson: EChatItemType.toJson)
      this.type,
      this.id,
      this.userId,
      this.userImage,
      this.userName,
      this.averageStars,
      this.totalReview,
      this.score,
      this.content,
      this.createdAt,
      this.name});

  factory _$ReviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewModelImplFromJson(json);

  @override
  final int? reviewId;
  @override
  @JsonKey(fromJson: EChatItemType.fromJson, toJson: EChatItemType.toJson)
  final EChatItemType? type;
  @override
  final int? id;
  @override
  final int? userId;
  @override
  final String? userImage;
  @override
  final String? userName;
  @override
  final double? averageStars;
  @override
  final int? totalReview;
  @override
  final int? score;
  @override
  final String? content;
  @override
  final DateTime? createdAt;
  @override
  final String? name;

  @override
  String toString() {
    return 'ReviewModel(reviewId: $reviewId, type: $type, id: $id, userId: $userId, userImage: $userImage, userName: $userName, averageStars: $averageStars, totalReview: $totalReview, score: $score, content: $content, createdAt: $createdAt, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewModelImpl &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.averageStars, averageStars) ||
                other.averageStars == averageStars) &&
            (identical(other.totalReview, totalReview) ||
                other.totalReview == totalReview) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reviewId,
      type,
      id,
      userId,
      userImage,
      userName,
      averageStars,
      totalReview,
      score,
      content,
      createdAt,
      name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewModelImplCopyWith<_$ReviewModelImpl> get copyWith =>
      __$$ReviewModelImplCopyWithImpl<_$ReviewModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewModelImplToJson(
      this,
    );
  }
}

abstract class _ReviewModel implements ReviewModel {
  factory _ReviewModel(
      {final int? reviewId,
      @JsonKey(fromJson: EChatItemType.fromJson, toJson: EChatItemType.toJson)
      final EChatItemType? type,
      final int? id,
      final int? userId,
      final String? userImage,
      final String? userName,
      final double? averageStars,
      final int? totalReview,
      final int? score,
      final String? content,
      final DateTime? createdAt,
      final String? name}) = _$ReviewModelImpl;

  factory _ReviewModel.fromJson(Map<String, dynamic> json) =
      _$ReviewModelImpl.fromJson;

  @override
  int? get reviewId;
  @override
  @JsonKey(fromJson: EChatItemType.fromJson, toJson: EChatItemType.toJson)
  EChatItemType? get type;
  @override
  int? get id;
  @override
  int? get userId;
  @override
  String? get userImage;
  @override
  String? get userName;
  @override
  double? get averageStars;
  @override
  int? get totalReview;
  @override
  int? get score;
  @override
  String? get content;
  @override
  DateTime? get createdAt;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$ReviewModelImplCopyWith<_$ReviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
