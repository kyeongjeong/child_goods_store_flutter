import 'package:child_goods_store_flutter/blocs/edit_product/edit_product_bloc.dart';
import 'package:child_goods_store_flutter/blocs/edit_product/edit_product_event.dart';
import 'package:child_goods_store_flutter/blocs/edit_product/edit_product_state.dart';
import 'package:child_goods_store_flutter/enums/product_status.dart';
import 'package:child_goods_store_flutter/widgets/app_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProductStatus extends StatelessWidget {
  const EditProductStatus({super.key});

  void _onChangeStatus(
    BuildContext context, {
    String? status,
  }) {
    if (status == null) return;
    context.read<EditProductBloc>().add(EditProductChangeStatus(
          status.productStatusEnum,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProductBloc, EditProductState>(
      buildWhen: (previous, current) =>
          previous.product.productStatus != current.product.productStatus,
      builder: (context, state) => AppDropdown(
        hint: '상태를 골라주세요',
        width: double.infinity,
        value: state.product.productStatus?.text,
        values: EProductStatus.values.map((cat) => cat.text).toList(),
        onChanged: (value) => _onChangeStatus(
          context,
          status: value,
        ),
      ),
    );
  }
}
