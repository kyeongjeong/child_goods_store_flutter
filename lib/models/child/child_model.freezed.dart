// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'child_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChildModel _$ChildModelFromJson(Map<String, dynamic> json) {
  return _ChildModel.fromJson(json);
}

/// @nodoc
mixin _$ChildModel {
  int? get childId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: EChildAge.fromJson, toJson: EChildAge.toJson)
  EChildAge? get age => throw _privateConstructorUsedError;
  @JsonKey(fromJson: EChildGender.fromJson, toJson: EChildGender.toJson)
  EChildGender? get gender => throw _privateConstructorUsedError;
  String? get childImg => throw _privateConstructorUsedError;
  @JsonKey(fromJson: strToList, toJson: listToStr)
  List<String> get tag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChildModelCopyWith<ChildModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChildModelCopyWith<$Res> {
  factory $ChildModelCopyWith(
          ChildModel value, $Res Function(ChildModel) then) =
      _$ChildModelCopyWithImpl<$Res, ChildModel>;
  @useResult
  $Res call(
      {int? childId,
      String? name,
      @JsonKey(fromJson: EChildAge.fromJson, toJson: EChildAge.toJson)
      EChildAge? age,
      @JsonKey(fromJson: EChildGender.fromJson, toJson: EChildGender.toJson)
      EChildGender? gender,
      String? childImg,
      @JsonKey(fromJson: strToList, toJson: listToStr) List<String> tag});
}

/// @nodoc
class _$ChildModelCopyWithImpl<$Res, $Val extends ChildModel>
    implements $ChildModelCopyWith<$Res> {
  _$ChildModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? childId = freezed,
    Object? name = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? childImg = freezed,
    Object? tag = null,
  }) {
    return _then(_value.copyWith(
      childId: freezed == childId
          ? _value.childId
          : childId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as EChildAge?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as EChildGender?,
      childImg: freezed == childImg
          ? _value.childImg
          : childImg // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChildModelImplCopyWith<$Res>
    implements $ChildModelCopyWith<$Res> {
  factory _$$ChildModelImplCopyWith(
          _$ChildModelImpl value, $Res Function(_$ChildModelImpl) then) =
      __$$ChildModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? childId,
      String? name,
      @JsonKey(fromJson: EChildAge.fromJson, toJson: EChildAge.toJson)
      EChildAge? age,
      @JsonKey(fromJson: EChildGender.fromJson, toJson: EChildGender.toJson)
      EChildGender? gender,
      String? childImg,
      @JsonKey(fromJson: strToList, toJson: listToStr) List<String> tag});
}

/// @nodoc
class __$$ChildModelImplCopyWithImpl<$Res>
    extends _$ChildModelCopyWithImpl<$Res, _$ChildModelImpl>
    implements _$$ChildModelImplCopyWith<$Res> {
  __$$ChildModelImplCopyWithImpl(
      _$ChildModelImpl _value, $Res Function(_$ChildModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? childId = freezed,
    Object? name = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? childImg = freezed,
    Object? tag = null,
  }) {
    return _then(_$ChildModelImpl(
      childId: freezed == childId
          ? _value.childId
          : childId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as EChildAge?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as EChildGender?,
      childImg: freezed == childImg
          ? _value.childImg
          : childImg // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: null == tag
          ? _value._tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChildModelImpl implements _ChildModel {
  _$ChildModelImpl(
      {this.childId,
      this.name,
      @JsonKey(fromJson: EChildAge.fromJson, toJson: EChildAge.toJson) this.age,
      @JsonKey(fromJson: EChildGender.fromJson, toJson: EChildGender.toJson)
      this.gender,
      this.childImg,
      @JsonKey(fromJson: strToList, toJson: listToStr)
      final List<String> tag = const []})
      : _tag = tag;

  factory _$ChildModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChildModelImplFromJson(json);

  @override
  final int? childId;
  @override
  final String? name;
  @override
  @JsonKey(fromJson: EChildAge.fromJson, toJson: EChildAge.toJson)
  final EChildAge? age;
  @override
  @JsonKey(fromJson: EChildGender.fromJson, toJson: EChildGender.toJson)
  final EChildGender? gender;
  @override
  final String? childImg;
  final List<String> _tag;
  @override
  @JsonKey(fromJson: strToList, toJson: listToStr)
  List<String> get tag {
    if (_tag is EqualUnmodifiableListView) return _tag;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tag);
  }

  @override
  String toString() {
    return 'ChildModel(childId: $childId, name: $name, age: $age, gender: $gender, childImg: $childImg, tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChildModelImpl &&
            (identical(other.childId, childId) || other.childId == childId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.childImg, childImg) ||
                other.childImg == childImg) &&
            const DeepCollectionEquality().equals(other._tag, _tag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, childId, name, age, gender,
      childImg, const DeepCollectionEquality().hash(_tag));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChildModelImplCopyWith<_$ChildModelImpl> get copyWith =>
      __$$ChildModelImplCopyWithImpl<_$ChildModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChildModelImplToJson(
      this,
    );
  }
}

abstract class _ChildModel implements ChildModel {
  factory _ChildModel(
      {final int? childId,
      final String? name,
      @JsonKey(fromJson: EChildAge.fromJson, toJson: EChildAge.toJson)
      final EChildAge? age,
      @JsonKey(fromJson: EChildGender.fromJson, toJson: EChildGender.toJson)
      final EChildGender? gender,
      final String? childImg,
      @JsonKey(fromJson: strToList, toJson: listToStr)
      final List<String> tag}) = _$ChildModelImpl;

  factory _ChildModel.fromJson(Map<String, dynamic> json) =
      _$ChildModelImpl.fromJson;

  @override
  int? get childId;
  @override
  String? get name;
  @override
  @JsonKey(fromJson: EChildAge.fromJson, toJson: EChildAge.toJson)
  EChildAge? get age;
  @override
  @JsonKey(fromJson: EChildGender.fromJson, toJson: EChildGender.toJson)
  EChildGender? get gender;
  @override
  String? get childImg;
  @override
  @JsonKey(fromJson: strToList, toJson: listToStr)
  List<String> get tag;
  @override
  @JsonKey(ignore: true)
  _$$ChildModelImplCopyWith<_$ChildModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
