import 'package:child_goods_store_flutter/blocs/edit_product/edit_product_bloc.dart';
import 'package:child_goods_store_flutter/blocs/edit_product/edit_product_event.dart';
import 'package:child_goods_store_flutter/blocs/edit_product/edit_product_state.dart';
import 'package:child_goods_store_flutter/enums/child_age.dart';
import 'package:child_goods_store_flutter/widgets/app_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProductAge extends StatelessWidget {
  const EditProductAge({super.key});

  void _onChangeAge(
    BuildContext context, {
    String? age,
  }) {
    if (age == null) return;
    context.read<EditProductBloc>().add(EditProductChangeAge(
          age == EChildAge.allAge ? null : age.childAgeEnum,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProductBloc, EditProductState>(
      buildWhen: (previous, current) =>
          previous.product.age != current.product.age,
      builder: (context, state) => AppDropdown(
        hint: '적정 연령을 골라주세요',
        width: double.infinity,
        value: state.product.age?.text ?? EChildAge.allAge,
        values: [
          EChildAge.allAge,
          ...EChildAge.values.map((cat) => cat.text).toList(),
        ],
        onChanged: (value) => _onChangeAge(
          context,
          age: value,
        ),
      ),
    );
  }
}
