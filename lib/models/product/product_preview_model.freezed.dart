// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_preview_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductPreviewModel _$ProductPreviewModelFromJson(Map<String, dynamic> json) {
  return _ProductPreviewModel.fromJson(json);
}

/// @nodoc
mixin _$ProductPreviewModel {
  int? get productId => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  EProductSaleStatus? get state => throw _privateConstructorUsedError;
  String? get productImage => throw _privateConstructorUsedError;
  bool? get productHeart => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductPreviewModelCopyWith<ProductPreviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPreviewModelCopyWith<$Res> {
  factory $ProductPreviewModelCopyWith(
          ProductPreviewModel value, $Res Function(ProductPreviewModel) then) =
      _$ProductPreviewModelCopyWithImpl<$Res, ProductPreviewModel>;
  @useResult
  $Res call(
      {int? productId,
      String? productName,
      int? price,
      EProductSaleStatus? state,
      String? productImage,
      bool? productHeart});
}

/// @nodoc
class _$ProductPreviewModelCopyWithImpl<$Res, $Val extends ProductPreviewModel>
    implements $ProductPreviewModelCopyWith<$Res> {
  _$ProductPreviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? productName = freezed,
    Object? price = freezed,
    Object? state = freezed,
    Object? productImage = freezed,
    Object? productHeart = freezed,
  }) {
    return _then(_value.copyWith(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as EProductSaleStatus?,
      productImage: freezed == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String?,
      productHeart: freezed == productHeart
          ? _value.productHeart
          : productHeart // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductPreviewModelImplCopyWith<$Res>
    implements $ProductPreviewModelCopyWith<$Res> {
  factory _$$ProductPreviewModelImplCopyWith(_$ProductPreviewModelImpl value,
          $Res Function(_$ProductPreviewModelImpl) then) =
      __$$ProductPreviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? productId,
      String? productName,
      int? price,
      EProductSaleStatus? state,
      String? productImage,
      bool? productHeart});
}

/// @nodoc
class __$$ProductPreviewModelImplCopyWithImpl<$Res>
    extends _$ProductPreviewModelCopyWithImpl<$Res, _$ProductPreviewModelImpl>
    implements _$$ProductPreviewModelImplCopyWith<$Res> {
  __$$ProductPreviewModelImplCopyWithImpl(_$ProductPreviewModelImpl _value,
      $Res Function(_$ProductPreviewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? productName = freezed,
    Object? price = freezed,
    Object? state = freezed,
    Object? productImage = freezed,
    Object? productHeart = freezed,
  }) {
    return _then(_$ProductPreviewModelImpl(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as EProductSaleStatus?,
      productImage: freezed == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String?,
      productHeart: freezed == productHeart
          ? _value.productHeart
          : productHeart // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductPreviewModelImpl implements _ProductPreviewModel {
  _$ProductPreviewModelImpl(
      {this.productId,
      this.productName,
      this.price,
      this.state,
      this.productImage,
      this.productHeart});

  factory _$ProductPreviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductPreviewModelImplFromJson(json);

  @override
  final int? productId;
  @override
  final String? productName;
  @override
  final int? price;
  @override
  final EProductSaleStatus? state;
  @override
  final String? productImage;
  @override
  final bool? productHeart;

  @override
  String toString() {
    return 'ProductPreviewModel(productId: $productId, productName: $productName, price: $price, state: $state, productImage: $productImage, productHeart: $productHeart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductPreviewModelImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.productHeart, productHeart) ||
                other.productHeart == productHeart));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productId, productName, price,
      state, productImage, productHeart);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductPreviewModelImplCopyWith<_$ProductPreviewModelImpl> get copyWith =>
      __$$ProductPreviewModelImplCopyWithImpl<_$ProductPreviewModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductPreviewModelImplToJson(
      this,
    );
  }
}

abstract class _ProductPreviewModel implements ProductPreviewModel {
  factory _ProductPreviewModel(
      {final int? productId,
      final String? productName,
      final int? price,
      final EProductSaleStatus? state,
      final String? productImage,
      final bool? productHeart}) = _$ProductPreviewModelImpl;

  factory _ProductPreviewModel.fromJson(Map<String, dynamic> json) =
      _$ProductPreviewModelImpl.fromJson;

  @override
  int? get productId;
  @override
  String? get productName;
  @override
  int? get price;
  @override
  EProductSaleStatus? get state;
  @override
  String? get productImage;
  @override
  bool? get productHeart;
  @override
  @JsonKey(ignore: true)
  _$$ProductPreviewModelImplCopyWith<_$ProductPreviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
