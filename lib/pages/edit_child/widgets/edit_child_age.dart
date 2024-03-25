import 'package:child_goods_store_flutter/blocs/edit_child/edit_child_bloc.dart';
import 'package:child_goods_store_flutter/blocs/edit_child/edit_child_event.dart';
import 'package:child_goods_store_flutter/blocs/edit_child/edit_child_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/enums/child_age.dart';
import 'package:child_goods_store_flutter/widgets/app_dropdown.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditChildAge extends StatelessWidget {
  const EditChildAge({super.key});

  void _onAgeChange(
    BuildContext context, {
    required String age,
  }) {
    var ag = age.childAgeEnum;
    context.read<EditChildBloc>().add(EditChildChangeAge(ag));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AppFont(
          '연령',
          fontSize: Sizes.size16,
          fontWeight: FontWeight.w700,
        ),
        Gaps.v10,
        BlocBuilder<EditChildBloc, EditChildState>(
          builder: (context, state) => AppDropdown(
            width: double.infinity,
            hint: '연령(개월)',
            value: state.child.age?.text,
            values: [for (var eAge in EChildAge.values) eAge.text],
            onChanged: (value) => _onAgeChange(
              context,
              age: value ?? Strings.nullStr,
            ),
          ),
        ),
      ],
    );
  }
}
