// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  int? get productId => throw _privateConstructorUsedError;
  UserProfileModel? get user => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(fromJson: EProductStatus.fromJson, toJson: EProductStatus.toJson)
  EProductStatus? get productStatus => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: EProductSaleStatus.fromJson, toJson: EProductSaleStatus.toJson)
  EProductSaleStatus? get state => throw _privateConstructorUsedError;
  DateTime? get createAt => throw _privateConstructorUsedError;
  DateTime? get updateAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: strToList, toJson: listToStr)
  List<String> get tag => throw _privateConstructorUsedError;
  @JsonKey(fromJson: strToList, toJson: listToStr)
  List<String> get productImage => throw _privateConstructorUsedError;
  bool? get productHeart => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {int? productId,
      UserProfileModel? user,
      String? productName,
      int? price,
      String? content,
      @JsonKey(fromJson: EProductStatus.fromJson, toJson: EProductStatus.toJson)
      EProductStatus? productStatus,
      @JsonKey(
          fromJson: EProductSaleStatus.fromJson,
          toJson: EProductSaleStatus.toJson)
      EProductSaleStatus? state,
      DateTime? createAt,
      DateTime? updateAt,
      @JsonKey(fromJson: strToList, toJson: listToStr) List<String> tag,
      @JsonKey(fromJson: strToList, toJson: listToStr)
      List<String> productImage,
      bool? productHeart});

  $UserProfileModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? user = freezed,
    Object? productName = freezed,
    Object? price = freezed,
    Object? content = freezed,
    Object? productStatus = freezed,
    Object? state = freezed,
    Object? createAt = freezed,
    Object? updateAt = freezed,
    Object? tag = null,
    Object? productImage = null,
    Object? productHeart = freezed,
  }) {
    return _then(_value.copyWith(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      productStatus: freezed == productStatus
          ? _value.productStatus
          : productStatus // ignore: cast_nullable_to_non_nullable
              as EProductStatus?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as EProductSaleStatus?,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateAt: freezed == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<String>,
      productImage: null == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as List<String>,
      productHeart: freezed == productHeart
          ? _value.productHeart
          : productHeart // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? productId,
      UserProfileModel? user,
      String? productName,
      int? price,
      String? content,
      @JsonKey(fromJson: EProductStatus.fromJson, toJson: EProductStatus.toJson)
      EProductStatus? productStatus,
      @JsonKey(
          fromJson: EProductSaleStatus.fromJson,
          toJson: EProductSaleStatus.toJson)
      EProductSaleStatus? state,
      DateTime? createAt,
      DateTime? updateAt,
      @JsonKey(fromJson: strToList, toJson: listToStr) List<String> tag,
      @JsonKey(fromJson: strToList, toJson: listToStr)
      List<String> productImage,
      bool? productHeart});

  @override
  $UserProfileModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? user = freezed,
    Object? productName = freezed,
    Object? price = freezed,
    Object? content = freezed,
    Object? productStatus = freezed,
    Object? state = freezed,
    Object? createAt = freezed,
    Object? updateAt = freezed,
    Object? tag = null,
    Object? productImage = null,
    Object? productHeart = freezed,
  }) {
    return _then(_$ProductModelImpl(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      productStatus: freezed == productStatus
          ? _value.productStatus
          : productStatus // ignore: cast_nullable_to_non_nullable
              as EProductStatus?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as EProductSaleStatus?,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateAt: freezed == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tag: null == tag
          ? _value._tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<String>,
      productImage: null == productImage
          ? _value._productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as List<String>,
      productHeart: freezed == productHeart
          ? _value.productHeart
          : productHeart // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl implements _ProductModel {
  _$ProductModelImpl(
      {this.productId,
      this.user,
      this.productName,
      this.price,
      this.content,
      @JsonKey(fromJson: EProductStatus.fromJson, toJson: EProductStatus.toJson)
      this.productStatus,
      @JsonKey(
          fromJson: EProductSaleStatus.fromJson,
          toJson: EProductSaleStatus.toJson)
      this.state,
      this.createAt,
      this.updateAt,
      @JsonKey(fromJson: strToList, toJson: listToStr)
      final List<String> tag = const [],
      @JsonKey(fromJson: strToList, toJson: listToStr)
      final List<String> productImage = const [],
      this.productHeart})
      : _tag = tag,
        _productImage = productImage;

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  final int? productId;
  @override
  final UserProfileModel? user;
  @override
  final String? productName;
  @override
  final int? price;
  @override
  final String? content;
  @override
  @JsonKey(fromJson: EProductStatus.fromJson, toJson: EProductStatus.toJson)
  final EProductStatus? productStatus;
  @override
  @JsonKey(
      fromJson: EProductSaleStatus.fromJson, toJson: EProductSaleStatus.toJson)
  final EProductSaleStatus? state;
  @override
  final DateTime? createAt;
  @override
  final DateTime? updateAt;
  final List<String> _tag;
  @override
  @JsonKey(fromJson: strToList, toJson: listToStr)
  List<String> get tag {
    if (_tag is EqualUnmodifiableListView) return _tag;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tag);
  }

  final List<String> _productImage;
  @override
  @JsonKey(fromJson: strToList, toJson: listToStr)
  List<String> get productImage {
    if (_productImage is EqualUnmodifiableListView) return _productImage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productImage);
  }

  @override
  final bool? productHeart;

  @override
  String toString() {
    return 'ProductModel(productId: $productId, user: $user, productName: $productName, price: $price, content: $content, productStatus: $productStatus, state: $state, createAt: $createAt, updateAt: $updateAt, tag: $tag, productImage: $productImage, productHeart: $productHeart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.productStatus, productStatus) ||
                other.productStatus == productStatus) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            const DeepCollectionEquality().equals(other._tag, _tag) &&
            const DeepCollectionEquality()
                .equals(other._productImage, _productImage) &&
            (identical(other.productHeart, productHeart) ||
                other.productHeart == productHeart));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productId,
      user,
      productName,
      price,
      content,
      productStatus,
      state,
      createAt,
      updateAt,
      const DeepCollectionEquality().hash(_tag),
      const DeepCollectionEquality().hash(_productImage),
      productHeart);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  factory _ProductModel(
      {final int? productId,
      final UserProfileModel? user,
      final String? productName,
      final int? price,
      final String? content,
      @JsonKey(fromJson: EProductStatus.fromJson, toJson: EProductStatus.toJson)
      final EProductStatus? productStatus,
      @JsonKey(
          fromJson: EProductSaleStatus.fromJson,
          toJson: EProductSaleStatus.toJson)
      final EProductSaleStatus? state,
      final DateTime? createAt,
      final DateTime? updateAt,
      @JsonKey(fromJson: strToList, toJson: listToStr) final List<String> tag,
      @JsonKey(fromJson: strToList, toJson: listToStr)
      final List<String> productImage,
      final bool? productHeart}) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  int? get productId;
  @override
  UserProfileModel? get user;
  @override
  String? get productName;
  @override
  int? get price;
  @override
  String? get content;
  @override
  @JsonKey(fromJson: EProductStatus.fromJson, toJson: EProductStatus.toJson)
  EProductStatus? get productStatus;
  @override
  @JsonKey(
      fromJson: EProductSaleStatus.fromJson, toJson: EProductSaleStatus.toJson)
  EProductSaleStatus? get state;
  @override
  DateTime? get createAt;
  @override
  DateTime? get updateAt;
  @override
  @JsonKey(fromJson: strToList, toJson: listToStr)
  List<String> get tag;
  @override
  @JsonKey(fromJson: strToList, toJson: listToStr)
  List<String> get productImage;
  @override
  bool? get productHeart;
  @override
  @JsonKey(ignore: true)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
