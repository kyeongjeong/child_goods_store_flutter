import 'package:child_goods_store_flutter/blocs/edit_address/edit_address_bloc.dart';
import 'package:child_goods_store_flutter/blocs/edit_address/edit_address_event.dart';
import 'package:child_goods_store_flutter/blocs/edit_address/edit_address_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/enums/address_category.dart';
import 'package:child_goods_store_flutter/widgets/app_dropdown.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditAddressCategory extends StatelessWidget {
  const EditAddressCategory({super.key});

  void _onCategoryChange(BuildContext context, {String? category}) {
    var cat = category?.addressCategoryEnum;
    if (cat == null) return;
    context.read<EditAddressBloc>().add(EditAddressChangeCategory(cat));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AppFont(
          '카테고리',
          fontSize: Sizes.size16,
          fontWeight: FontWeight.w700,
        ),
        Gaps.v10,
        BlocBuilder<EditAddressBloc, EditAddressState>(
          builder: (context, state) => AppDropdown(
            value: state.address.category?.text,
            values: [
              for (var category in EAddressCategory.values) category.text,
            ],
            onChanged: (value) => _onCategoryChange(
              context,
              category: value,
            ),
            hint: '배송지 카테고리를 선택해주세요',
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
