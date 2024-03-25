import 'package:child_goods_store_flutter/enums/child_age.dart';
import 'package:child_goods_store_flutter/enums/child_gender.dart';
import 'package:child_goods_store_flutter/enums/main_category.dart';
import 'package:child_goods_store_flutter/enums/search_range.dart';
import 'package:child_goods_store_flutter/enums/sub_category.dart';

abstract class ProductListEvent {}

class ProductListGet extends ProductListEvent {}

class ProductListChangeMainCat extends ProductListEvent {
  EMainCategory? mainCategory;
  bool? reset;

  ProductListChangeMainCat({
    this.mainCategory,
    this.reset,
  });
}

class ProductListChangeSubCat extends ProductListEvent {
  ESubCategory subCategory;

  ProductListChangeSubCat(this.subCategory);
}

class ProductListChangeRegion extends ProductListEvent {
  ESearchRange region;

  ProductListChangeRegion(this.region);
}

class ProductListChangeAgeFilter extends ProductListEvent {
  final EChildAge? age;
  final bool? reset;

  ProductListChangeAgeFilter({
    this.age,
    this.reset,
  });
}

class ProductListChangeGenderFilter extends ProductListEvent {
  final EChildGender? gender;
  final bool? reset;

  ProductListChangeGenderFilter({
    this.gender,
    this.reset,
  });
}

class ProductListChangePriceFilter extends ProductListEvent {
  final int? minPrice;
  final int? maxPrice;

  ProductListChangePriceFilter({
    this.minPrice,
    this.maxPrice,
  });
}

class ProductListApplyFilter extends ProductListEvent {}
