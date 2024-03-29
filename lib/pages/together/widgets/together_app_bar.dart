import 'package:child_goods_store_flutter/blocs/together/list/together_list_bloc.dart';
import 'package:child_goods_store_flutter/blocs/together/list/together_list_event.dart';
import 'package:child_goods_store_flutter/blocs/together/list/together_list_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/enums/main_category.dart';
import 'package:child_goods_store_flutter/enums/search_range.dart';
import 'package:child_goods_store_flutter/enums/sub_category.dart';
import 'package:child_goods_store_flutter/pages/together/widgets/together_app_bar_filter.dart';
import 'package:child_goods_store_flutter/widgets/app_dropdown.dart';
import 'package:child_goods_store_flutter/widgets/app_h_spliter.dart';
import 'package:child_goods_store_flutter/widgets/common/v_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TogetherAppBar extends StatefulWidget {
  const TogetherAppBar({super.key});

  @override
  State<TogetherAppBar> createState() => _TogetherAppBarState();
}

class _TogetherAppBarState extends State<TogetherAppBar> {
  static const String _allCategory = '전체';

  void _onChangeMainCategory(String? mainCat) {
    if (mainCat == null) return;
    context.read<TogetherListBloc>().add(TogetherListChangeMainCat(
          mainCategory:
              mainCat == _allCategory ? null : mainCat.mainCategoryEnum,
          reset: mainCat == _allCategory,
        ));
  }

  void _onChangeSubCategory(ESubCategory subCat) {
    context.read<TogetherListBloc>().add(TogetherListChangeSubCat(subCat));
  }

  void _onChangeRegion(String? region) {
    if (region == null) return;
    context
        .read<TogetherListBloc>()
        .add(TogetherListChangeRegion(region.searchRangeEnum));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocBuilder<TogetherListBloc, TogetherListState>(
            builder: (context, state) => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size5,
                horizontal: Sizes.size20,
              ),
              child: Row(
                children: [
                  AppDropdown(
                    width: MediaQuery.sizeOf(context).width / 2 - Sizes.size28,
                    hint: '카테고리',
                    value: state.mainCategory?.text,
                    values: [
                      ...EMainCategory.values.map((cat) => cat.text).toList(),
                      _allCategory
                    ],
                    onChanged: _onChangeMainCategory,
                  ),
                  Gaps.h16,
                  AppDropdown(
                    width: MediaQuery.sizeOf(context).width / 2 - Sizes.size28,
                    hint: '검색 지역',
                    value: state.region.text,
                    values: ESearchRange.values.map((reg) => reg.text).toList(),
                    onChanged: _onChangeRegion,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<TogetherListBloc, TogetherListState>(
              builder: (context, state) => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size20,
                  vertical: Sizes.size10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (var subCat in ESubCategory.values
                        .where((cat) => cat.mainCategory == state.mainCategory)
                        .toList())
                      Padding(
                        padding: const EdgeInsets.only(right: Sizes.size10),
                        child: VIconButton(
                          isStack: true,
                          icon: subCat.icon,
                          title: subCat.text.replaceAll('/', '\n'),
                          onTap: () => _onChangeSubCategory(subCat),
                          isSelected: subCat == state.subCategory,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          const TogetherAppBarFilters(),
          Gaps.v5,
          const AppHSpliter(),
        ],
      ),
    );
  }
}
