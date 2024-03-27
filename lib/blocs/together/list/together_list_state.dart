import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/child_age.dart';
import 'package:child_goods_store_flutter/enums/child_gender.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/enums/main_category.dart';
import 'package:child_goods_store_flutter/enums/search_range.dart';
import 'package:child_goods_store_flutter/enums/sub_category.dart';
import 'package:child_goods_store_flutter/models/together/together_preview_model.dart';

class TogetherListState extends BlocState {
  final EMainCategory? mainCategory;
  final ESubCategory? subCategory;
  final ESearchRange region;
  final EChildAge? age;
  final EChildGender? gender;
  final bool applyFilter;
  final List<TogetherPreviewModel> togethers;

  const TogetherListState({
    this.mainCategory,
    this.subCategory,
    required this.region,
    required this.togethers,
    this.age,
    this.gender,
    required this.applyFilter,
    required super.status,
    super.message,
  });

  const TogetherListState.init()
      : mainCategory = null,
        subCategory = null,
        region = ESearchRange.myRegion,
        age = null,
        gender = null,
        applyFilter = true,
        togethers = const [],
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  TogetherListState copyWith({
    ELoadingStatus? status,
    String? message,
    List<TogetherPreviewModel>? togethers,
    EMainCategory? mainCategory,
    bool? resetMain,
    ESubCategory? subCategory,
    bool? resetSub,
    ESearchRange? region,
    EChildAge? age,
    bool? resetAge,
    EChildGender? gender,
    bool? resetGender,
    bool? applyFilter,
  }) =>
      TogetherListState(
        status: status ?? this.status,
        message: message ?? this.message,
        togethers: togethers ?? this.togethers,
        mainCategory:
            resetMain == true ? null : (mainCategory ?? this.mainCategory),
        subCategory:
            resetSub == true ? null : (subCategory ?? this.subCategory),
        region: region ?? this.region,
        age: resetAge == true ? null : (age ?? this.age),
        gender: resetGender == true ? null : (gender ?? this.gender),
        applyFilter: applyFilter ?? this.applyFilter,
      );

  @override
  List<Object?> get props => [
        status,
        message,
        togethers,
        mainCategory,
        subCategory,
        region,
        age,
        gender,
        applyFilter,
      ];
}
