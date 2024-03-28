import 'package:child_goods_store_flutter/blocs/edit_together/edit_together_bloc.dart';
import 'package:child_goods_store_flutter/blocs/edit_together/edit_together_event.dart';
import 'package:child_goods_store_flutter/blocs/edit_together/edit_together_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/enums/main_category.dart';
import 'package:child_goods_store_flutter/enums/sub_category.dart';
import 'package:child_goods_store_flutter/widgets/app_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditTogetherCategory extends StatelessWidget {
  const EditTogetherCategory({super.key});

  void _onChangeMainCat(
    BuildContext context, {
    String? mainCategory,
  }) {
    if (mainCategory == null) return;
    context.read<EditTogetherBloc>().add(EditTogetherChangeMainCat(
          mainCategory.mainCategoryEnum,
        ));
  }

  void _onChangeSubCat(
    BuildContext context, {
    String? subCategory,
  }) {
    if (subCategory == null) return;
    context.read<EditTogetherBloc>().add(EditTogetherChangeSubCat(
          subCategory.subCategoryEnum,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditTogetherBloc, EditTogetherState>(
      buildWhen: (previous, current) =>
          previous.together.mainCategory != current.together.mainCategory ||
          previous.together.subCategory != current.together.subCategory,
      builder: (context, state) => Row(
        children: [
          AppDropdown(
            width: MediaQuery.sizeOf(context).width / 2 - Sizes.size28,
            hint: '카테고리',
            value: state.together.mainCategory?.text,
            values: EMainCategory.values.map((cat) => cat.text).toList(),
            onChanged: (value) => _onChangeMainCat(
              context,
              mainCategory: value,
            ),
          ),
          Gaps.h16,
          AppDropdown(
            width: MediaQuery.sizeOf(context).width / 2 - Sizes.size28,
            hint: '서브 카테고리',
            value: state.together.subCategory?.text,
            values: ESubCategory.values
                .where((cat) => cat.mainCategory == state.together.mainCategory)
                .map((cat) => cat.text)
                .toList(),
            onChanged: (value) => _onChangeSubCat(
              context,
              subCategory: value,
            ),
          ),
        ],
      ),
    );
  }
}
