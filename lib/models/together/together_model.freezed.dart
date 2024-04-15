// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'together_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TogetherModel _$TogetherModelFromJson(Map<String, dynamic> json) {
  return _TogetherModel.fromJson(json);
}

/// @nodoc
mixin _$TogetherModel {
  int? get togetherId => throw _privateConstructorUsedError;
  UserProfileModel? get user => throw _privateConstructorUsedError;
  String? get togetherName => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;
  int? get totalPrice => throw _privateConstructorUsedError;
  int? get purchasePrice => throw _privateConstructorUsedError;
  @JsonKey(fromJson: EMainCategory.fromJson, toJson: EMainCategory.toJson)
  EMainCategory? get mainCategory => throw _privateConstructorUsedError;
  @JsonKey(fromJson: ESubCategory.fromJson, toJson: ESubCategory.toJson)
  ESubCategory? get subCategory => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: EProductSaleState.fromJson, toJson: EProductSaleState.toJson)
  EProductSaleState? get state => throw _privateConstructorUsedError;
  @JsonKey(fromJson: EChildAge.fromJson, toJson: EChildAge.toJson)
  EChildAge? get age => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get detailAddress => throw _privateConstructorUsedError;
  int? get totalNum => throw _privateConstructorUsedError;
  int? get purchaseNum => throw _privateConstructorUsedError;
  List<String> get tag => throw _privateConstructorUsedError;
  List<String> get togetherImage => throw _privateConstructorUsedError;
  bool? get togetherHeart => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TogetherModelCopyWith<TogetherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TogetherModelCopyWith<$Res> {
  factory $TogetherModelCopyWith(
          TogetherModel value, $Res Function(TogetherModel) then) =
      _$TogetherModelCopyWithImpl<$Res, TogetherModel>;
  @useResult
  $Res call(
      {int? togetherId,
      UserProfileModel? user,
      String? togetherName,
      String? details,
      int? totalPrice,
      int? purchasePrice,
      @JsonKey(fromJson: EMainCategory.fromJson, toJson: EMainCategory.toJson)
      EMainCategory? mainCategory,
      @JsonKey(fromJson: ESubCategory.fromJson, toJson: ESubCategory.toJson)
      ESubCategory? subCategory,
      @JsonKey(
          fromJson: EProductSaleState.fromJson,
          toJson: EProductSaleState.toJson)
      EProductSaleState? state,
      @JsonKey(fromJson: EChildAge.fromJson, toJson: EChildAge.toJson)
      EChildAge? age,
      String? link,
      DateTime? deadline,
      String? address,
      String? detailAddress,
      int? totalNum,
      int? purchaseNum,
      List<String> tag,
      List<String> togetherImage,
      bool? togetherHeart});

  $UserProfileModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$TogetherModelCopyWithImpl<$Res, $Val extends TogetherModel>
    implements $TogetherModelCopyWith<$Res> {
  _$TogetherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? togetherId = freezed,
    Object? user = freezed,
    Object? togetherName = freezed,
    Object? details = freezed,
    Object? totalPrice = freezed,
    Object? purchasePrice = freezed,
    Object? mainCategory = freezed,
    Object? subCategory = freezed,
    Object? state = freezed,
    Object? age = freezed,
    Object? link = freezed,
    Object? deadline = freezed,
    Object? address = freezed,
    Object? detailAddress = freezed,
    Object? totalNum = freezed,
    Object? purchaseNum = freezed,
    Object? tag = null,
    Object? togetherImage = null,
    Object? togetherHeart = freezed,
  }) {
    return _then(_value.copyWith(
      togetherId: freezed == togetherId
          ? _value.togetherId
          : togetherId // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
      togetherName: freezed == togetherName
          ? _value.togetherName
          : togetherName // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      purchasePrice: freezed == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      mainCategory: freezed == mainCategory
          ? _value.mainCategory
          : mainCategory // ignore: cast_nullable_to_non_nullable
              as EMainCategory?,
      subCategory: freezed == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as ESubCategory?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as EProductSaleState?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as EChildAge?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      detailAddress: freezed == detailAddress
          ? _value.detailAddress
          : detailAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      totalNum: freezed == totalNum
          ? _value.totalNum
          : totalNum // ignore: cast_nullable_to_non_nullable
              as int?,
      purchaseNum: freezed == purchaseNum
          ? _value.purchaseNum
          : purchaseNum // ignore: cast_nullable_to_non_nullable
              as int?,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<String>,
      togetherImage: null == togetherImage
          ? _value.togetherImage
          : togetherImage // ignore: cast_nullable_to_non_nullable
              as List<String>,
      togetherHeart: freezed == togetherHeart
          ? _value.togetherHeart
          : togetherHeart // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserProfileModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TogetherModelImplCopyWith<$Res>
    implements $TogetherModelCopyWith<$Res> {
  factory _$$TogetherModelImplCopyWith(
          _$TogetherModelImpl value, $Res Function(_$TogetherModelImpl) then) =
      __$$TogetherModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? togetherId,
      UserProfileModel? user,
      String? togetherName,
      String? details,
      int? totalPrice,
      int? purchasePrice,
      @JsonKey(fromJson: EMainCategory.fromJson, toJson: EMainCategory.toJson)
      EMainCategory? mainCategory,
      @JsonKey(fromJson: ESubCategory.fromJson, toJson: ESubCategory.toJson)
      ESubCategory? subCategory,
      @JsonKey(
          fromJson: EProductSaleState.fromJson,
          toJson: EProductSaleState.toJson)
      EProductSaleState? state,
      @JsonKey(fromJson: EChildAge.fromJson, toJson: EChildAge.toJson)
      EChildAge? age,
      String? link,
      DateTime? deadline,
      String? address,
      String? detailAddress,
      int? totalNum,
      int? purchaseNum,
      List<String> tag,
      List<String> togetherImage,
      bool? togetherHeart});

  @override
  $UserProfileModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$TogetherModelImplCopyWithImpl<$Res>
    extends _$TogetherModelCopyWithImpl<$Res, _$TogetherModelImpl>
    implements _$$TogetherModelImplCopyWith<$Res> {
  __$$TogetherModelImplCopyWithImpl(
      _$TogetherModelImpl _value, $Res Function(_$TogetherModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? togetherId = freezed,
    Object? user = freezed,
    Object? togetherName = freezed,
    Object? details = freezed,
    Object? totalPrice = freezed,
    Object? purchasePrice = freezed,
    Object? mainCategory = freezed,
    Object? subCategory = freezed,
    Object? state = freezed,
    Object? age = freezed,
    Object? link = freezed,
    Object? deadline = freezed,
    Object? address = freezed,
    Object? detailAddress = freezed,
    Object? totalNum = freezed,
    Object? purchaseNum = freezed,
    Object? tag = null,
    Object? togetherImage = null,
    Object? togetherHeart = freezed,
  }) {
    return _then(_$TogetherModelImpl(
      togetherId: freezed == togetherId
          ? _value.togetherId
          : togetherId // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
      togetherName: freezed == togetherName
          ? _value.togetherName
          : togetherName // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      purchasePrice: freezed == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      mainCategory: freezed == mainCategory
          ? _value.mainCategory
          : mainCategory // ignore: cast_nullable_to_non_nullable
              as EMainCategory?,
      subCategory: freezed == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as ESubCategory?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as EProductSaleState?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as EChildAge?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      detailAddress: freezed == detailAddress
          ? _value.detailAddress
          : detailAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      totalNum: freezed == totalNum
          ? _value.totalNum
          : totalNum // ignore: cast_nullable_to_non_nullable
              as int?,
      purchaseNum: freezed == purchaseNum
          ? _value.purchaseNum
          : purchaseNum // ignore: cast_nullable_to_non_nullable
              as int?,
      tag: null == tag
          ? _value._tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<String>,
      togetherImage: null == togetherImage
          ? _value._togetherImage
          : togetherImage // ignore: cast_nullable_to_non_nullable
              as List<String>,
      togetherHeart: freezed == togetherHeart
          ? _value.togetherHeart
          : togetherHeart // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TogetherModelImpl implements _TogetherModel {
  _$TogetherModelImpl(
      {this.togetherId,
      this.user,
      this.togetherName,
      this.details,
      this.totalPrice,
      this.purchasePrice,
      @JsonKey(fromJson: EMainCategory.fromJson, toJson: EMainCategory.toJson)
      this.mainCategory,
      @JsonKey(fromJson: ESubCategory.fromJson, toJson: ESubCategory.toJson)
      this.subCategory,
      @JsonKey(
          fromJson: EProductSaleState.fromJson,
          toJson: EProductSaleState.toJson)
      this.state,
      @JsonKey(fromJson: EChildAge.fromJson, toJson: EChildAge.toJson) this.age,
      this.link,
      this.deadline,
      this.address,
      this.detailAddress,
      this.totalNum,
      this.purchaseNum,
      final List<String> tag = const [],
      final List<String> togetherImage = const [],
      this.togetherHeart})
      : _tag = tag,
        _togetherImage = togetherImage;

  factory _$TogetherModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TogetherModelImplFromJson(json);

  @override
  final int? togetherId;
  @override
  final UserProfileModel? user;
  @override
  final String? togetherName;
  @override
  final String? details;
  @override
  final int? totalPrice;
  @override
  final int? purchasePrice;
  @override
  @JsonKey(fromJson: EMainCategory.fromJson, toJson: EMainCategory.toJson)
  final EMainCategory? mainCategory;
  @override
  @JsonKey(fromJson: ESubCategory.fromJson, toJson: ESubCategory.toJson)
  final ESubCategory? subCategory;
  @override
  @JsonKey(
      fromJson: EProductSaleState.fromJson, toJson: EProductSaleState.toJson)
  final EProductSaleState? state;
  @override
  @JsonKey(fromJson: EChildAge.fromJson, toJson: EChildAge.toJson)
  final EChildAge? age;
  @override
  final String? link;
  @override
  final DateTime? deadline;
  @override
  final String? address;
  @override
  final String? detailAddress;
  @override
  final int? totalNum;
  @override
  final int? purchaseNum;
  final List<String> _tag;
  @override
  @JsonKey()
  List<String> get tag {
    if (_tag is EqualUnmodifiableListView) return _tag;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tag);
  }

  final List<String> _togetherImage;
  @override
  @JsonKey()
  List<String> get togetherImage {
    if (_togetherImage is EqualUnmodifiableListView) return _togetherImage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_togetherImage);
  }

  @override
  final bool? togetherHeart;

  @override
  String toString() {
    return 'TogetherModel(togetherId: $togetherId, user: $user, togetherName: $togetherName, details: $details, totalPrice: $totalPrice, purchasePrice: $purchasePrice, mainCategory: $mainCategory, subCategory: $subCategory, state: $state, age: $age, link: $link, deadline: $deadline, address: $address, detailAddress: $detailAddress, totalNum: $totalNum, purchaseNum: $purchaseNum, tag: $tag, togetherImage: $togetherImage, togetherHeart: $togetherHeart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TogetherModelImpl &&
            (identical(other.togetherId, togetherId) ||
                other.togetherId == togetherId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.togetherName, togetherName) ||
                other.togetherName == togetherName) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.purchasePrice, purchasePrice) ||
                other.purchasePrice == purchasePrice) &&
            (identical(other.mainCategory, mainCategory) ||
                other.mainCategory == mainCategory) &&
            (identical(other.subCategory, subCategory) ||
                other.subCategory == subCategory) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.detailAddress, detailAddress) ||
                other.detailAddress == detailAddress) &&
            (identical(other.totalNum, totalNum) ||
                other.totalNum == totalNum) &&
            (identical(other.purchaseNum, purchaseNum) ||
                other.purchaseNum == purchaseNum) &&
            const DeepCollectionEquality().equals(other._tag, _tag) &&
            const DeepCollectionEquality()
                .equals(other._togetherImage, _togetherImage) &&
            (identical(other.togetherHeart, togetherHeart) ||
                other.togetherHeart == togetherHeart));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        togetherId,
        user,
        togetherName,
        details,
        totalPrice,
        purchasePrice,
        mainCategory,
        subCategory,
        state,
        age,
        link,
        deadline,
        address,
        detailAddress,
        totalNum,
        purchaseNum,
        const DeepCollectionEquality().hash(_tag),
        const DeepCollectionEquality().hash(_togetherImage),
        togetherHeart
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TogetherModelImplCopyWith<_$TogetherModelImpl> get copyWith =>
      __$$TogetherModelImplCopyWithImpl<_$TogetherModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TogetherModelImplToJson(
      this,
    );
  }
}

abstract class _TogetherModel implements TogetherModel {
  factory _TogetherModel(
      {final int? togetherId,
      final UserProfileModel? user,
      final String? togetherName,
      final String? details,
      final int? totalPrice,
      final int? purchasePrice,
      @JsonKey(fromJson: EMainCategory.fromJson, toJson: EMainCategory.toJson)
      final EMainCategory? mainCategory,
      @JsonKey(fromJson: ESubCategory.fromJson, toJson: ESubCategory.toJson)
      final ESubCategory? subCategory,
      @JsonKey(
          fromJson: EProductSaleState.fromJson,
          toJson: EProductSaleState.toJson)
      final EProductSaleState? state,
      @JsonKey(fromJson: EChildAge.fromJson, toJson: EChildAge.toJson)
      final EChildAge? age,
      final String? link,
      final DateTime? deadline,
      final String? address,
      final String? detailAddress,
      final int? totalNum,
      final int? purchaseNum,
      final List<String> tag,
      final List<String> togetherImage,
      final bool? togetherHeart}) = _$TogetherModelImpl;

  factory _TogetherModel.fromJson(Map<String, dynamic> json) =
      _$TogetherModelImpl.fromJson;

  @override
  int? get togetherId;
  @override
  UserProfileModel? get user;
  @override
  String? get togetherName;
  @override
  String? get details;
  @override
  int? get totalPrice;
  @override
  int? get purchasePrice;
  @override
  @JsonKey(fromJson: EMainCategory.fromJson, toJson: EMainCategory.toJson)
  EMainCategory? get mainCategory;
  @override
  @JsonKey(fromJson: ESubCategory.fromJson, toJson: ESubCategory.toJson)
  ESubCategory? get subCategory;
  @override
  @JsonKey(
      fromJson: EProductSaleState.fromJson, toJson: EProductSaleState.toJson)
  EProductSaleState? get state;
  @override
  @JsonKey(fromJson: EChildAge.fromJson, toJson: EChildAge.toJson)
  EChildAge? get age;
  @override
  String? get link;
  @override
  DateTime? get deadline;
  @override
  String? get address;
  @override
  String? get detailAddress;
  @override
  int? get totalNum;
  @override
  int? get purchaseNum;
  @override
  List<String> get tag;
  @override
  List<String> get togetherImage;
  @override
  bool? get togetherHeart;
  @override
  @JsonKey(ignore: true)
  _$$TogetherModelImplCopyWith<_$TogetherModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
