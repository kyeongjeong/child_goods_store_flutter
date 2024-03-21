import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/child_age.dart';
import 'package:child_goods_store_flutter/enums/child_gender.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/enums/main_category.dart';
import 'package:child_goods_store_flutter/enums/search_range.dart';
import 'package:child_goods_store_flutter/enums/sub_category.dart';
import 'package:child_goods_store_flutter/models/product/product_preview_model.dart';

class ProductListState extends BlocState {
  // ignore: constant_identifier_names
  static const int MIN_PRICE = 0;
  // ignore: constant_identifier_names
  static const int MAX_PRICE = 200000;

  final EMainCategory? mainCategory;
  final ESubCategory? subCategory;
  final ESearchRange region;
  final EChildAge? age;
  final EChildGender? gender;
  final int minPrice;
  final int maxPrice;
  final bool applyFilter;
  final List<ProductPreviewModel> products;

  const ProductListState({
    required this.mainCategory,
    required this.subCategory,
    required this.region,
    required this.products,
    this.age,
    this.gender,
    required this.minPrice,
    required this.maxPrice,
    required this.applyFilter,
    required super.status,
    super.message,
  });

  const ProductListState.init()
      : mainCategory = null,
        subCategory = null,
        region = ESearchRange.myRegion,
        age = null,
        gender = null,
        minPrice = MIN_PRICE,
        maxPrice = MAX_PRICE,
        applyFilter = true,
        products = const [],
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  ProductListState copyWith({
    ELoadingStatus? status,
    String? message,
    List<ProductPreviewModel>? products,
    EMainCategory? mainCategory,
    bool? resetMain,
    ESubCategory? subCategory,
    bool? resetSub,
    ESearchRange? region,
    EChildAge? age,
    bool? resetAge,
    EChildGender? gender,
    bool? resetGender,
    int? minPrice,
    int? maxPrice,
    bool? applyFilter,
  }) =>
      ProductListState(
        status: status ?? this.status,
        message: message ?? this.message,
        products: products ?? this.products,
        mainCategory:
            resetMain == true ? null : (mainCategory ?? this.mainCategory),
        subCategory:
            resetSub == true ? null : (subCategory ?? this.subCategory),
        region: region ?? this.region,
        age: resetAge == true ? null : (age ?? this.age),
        gender: resetGender == true ? null : (gender ?? this.gender),
        minPrice: minPrice ?? this.minPrice,
        maxPrice: maxPrice ?? this.maxPrice,
        applyFilter: applyFilter ?? this.applyFilter,
      );

  @override
  List<Object?> get props => [
        status,
        message,
        products,
        mainCategory,
        subCategory,
        region,
        age,
        gender,
        minPrice,
        maxPrice,
        applyFilter,
      ];
}
