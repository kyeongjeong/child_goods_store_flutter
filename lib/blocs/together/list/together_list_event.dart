import 'package:child_goods_store_flutter/enums/child_age.dart';
import 'package:child_goods_store_flutter/enums/child_gender.dart';
import 'package:child_goods_store_flutter/enums/main_category.dart';
import 'package:child_goods_store_flutter/enums/search_range.dart';
import 'package:child_goods_store_flutter/enums/sub_category.dart';

abstract class TogetherListEvent {}

class TogetherListGet extends TogetherListEvent {}

class TogetherListChangeMainCat extends TogetherListEvent {
  EMainCategory? mainCategory;
  bool? reset;

  TogetherListChangeMainCat({
    this.mainCategory,
    this.reset,
  });
}

class TogetherListChangeSubCat extends TogetherListEvent {
  ESubCategory subCategory;

  TogetherListChangeSubCat(this.subCategory);
}

class TogetherListChangeRegion extends TogetherListEvent {
  ESearchRange region;

  TogetherListChangeRegion(this.region);
}

class TogetherListChangeAgeFilter extends TogetherListEvent {
  final EChildAge? age;
  final bool? reset;

  TogetherListChangeAgeFilter({
    this.age,
    this.reset,
  });
}

class TogetherListChangeGenderFilter extends TogetherListEvent {
  final EChildGender? gender;
  final bool? reset;

  TogetherListChangeGenderFilter({
    this.gender,
    this.reset,
  });
}

class TogetherListApplyFilter extends TogetherListEvent {}
