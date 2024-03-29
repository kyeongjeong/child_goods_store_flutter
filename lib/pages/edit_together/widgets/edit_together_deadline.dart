import 'package:child_goods_store_flutter/blocs/edit_together/edit_together_bloc.dart';
import 'package:child_goods_store_flutter/blocs/edit_together/edit_together_event.dart';
import 'package:child_goods_store_flutter/blocs/edit_together/edit_together_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/widgets/app_bottom_sheet.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditTogetherDeadline extends StatefulWidget {
  const EditTogetherDeadline({super.key});

  @override
  State<EditTogetherDeadline> createState() => _EditTogetherDeadlineState();
}

class _EditTogetherDeadlineState extends State<EditTogetherDeadline> {
  void _onTapEditTag() {
    AppBottomSheet.show(
      context,
      child: SizedBox(
        height: 200,
        child: CupertinoDatePicker(
          initialDateTime:
              context.read<EditTogetherBloc>().state.together.deadline ??
                  DateTime.now(),
          minimumDate: DateTime.now(),
          maximumDate: DateTime.now().add(const Duration(days: 365)),
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (DateTime value) {
            context
                .read<EditTogetherBloc>()
                .add(EditTogetherChangeDeadline(value));
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _onTapEditTag,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const AppFont(
                '모집 기한',
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w700,
              ),
              Gaps.h10,
              SizedBox(
                width: Sizes.size40,
                height: Sizes.size40,
                child: AppInkButton(
                  borderRadSize: Sizes.size20,
                  onTap: _onTapEditTag,
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    Icons.edit_rounded,
                    color: Colors.white,
                    size: Sizes.size20,
                  ),
                ),
              ),
            ],
          ),
          Gaps.v5,
          BlocBuilder<EditTogetherBloc, EditTogetherState>(
            buildWhen: (previous, current) =>
                previous.together.deadline != current.together.deadline,
            builder: (context, state) => AppFont(
                state.together.deadline?.toString().split(' ').first ??
                    '모집 기한을 설정해주세요'),
          ),
        ],
      ),
    );
  }
}
