import 'package:child_goods_store_flutter/blocs/edit_child/edit_child_bloc.dart';
import 'package:child_goods_store_flutter/blocs/edit_child/edit_child_event.dart';
import 'package:child_goods_store_flutter/blocs/edit_child/edit_child_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditChildGender extends StatelessWidget {
  const EditChildGender({super.key});

  void _onGenderChange(
    BuildContext context, {
    required String gender,
  }) {
    context.read<EditChildBloc>().add(EditChildChangeGender(gender));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AppFont(
          '성별',
          fontSize: Sizes.size16,
          fontWeight: FontWeight.w700,
        ),
        Gaps.v10,
        BlocBuilder<EditChildBloc, EditChildState>(
          builder: (context, state) => Row(
            children: [
              AppInkButton(
                onTap: () => _onGenderChange(context, gender: 'M'),
                color: state.child.gender == 'M'
                    ? null
                    : Theme.of(context).scaffoldBackgroundColor,
                child: AppFont(
                  '남아',
                  color:
                      state.child.gender == 'M' ? Colors.white : Colors.black,
                ),
              ),
              Gaps.h10,
              AppInkButton(
                onTap: () => _onGenderChange(context, gender: 'W'),
                color: state.child.gender == 'W'
                    ? null
                    : Theme.of(context).scaffoldBackgroundColor,
                child: AppFont(
                  '여아',
                  color:
                      state.child.gender == 'W' ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
