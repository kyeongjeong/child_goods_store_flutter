import 'package:child_goods_store_flutter/blocs/edit_child/edit_child_bloc.dart';
import 'package:child_goods_store_flutter/blocs/edit_child/edit_child_event.dart';
import 'package:child_goods_store_flutter/blocs/edit_child/edit_child_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/enums/child_gender.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditChildGender extends StatelessWidget {
  const EditChildGender({super.key});

  void _onGenderChange(
    BuildContext context, {
    required EChildGender gender,
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
              for (var gender in EChildGender.values)
                Padding(
                  padding: const EdgeInsets.only(right: Sizes.size10),
                  child: AppInkButton(
                    onTap: () => _onGenderChange(context, gender: gender),
                    color: state.child.gender == gender
                        ? null
                        : Theme.of(context).scaffoldBackgroundColor,
                    child: AppFont(
                      gender.text,
                      color: state.child.gender == gender
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
