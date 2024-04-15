import 'package:child_goods_store_flutter/blocs/together/list/together_list_bloc.dart';
import 'package:child_goods_store_flutter/blocs/together/list/together_list_event.dart';
import 'package:child_goods_store_flutter/blocs/together/list/together_list_state.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/enums/child_age.dart';
import 'package:child_goods_store_flutter/widgets/app_bottom_sheet.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TogetherAppBarFilters extends StatefulWidget {
  const TogetherAppBarFilters({super.key});

  @override
  State<TogetherAppBarFilters> createState() => _TogetherAppBarFiltersState();
}

class _TogetherAppBarFiltersState extends State<TogetherAppBarFilters> {
  void _onTapAgeFilter() {
    AppBottomSheet.show(
      context,
      child: Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var age in EChildAge.values)
              AppInkButton(
                color: Colors.transparent,
                shadowColor: Colors.transparent,
                onTap: () {
                  context
                      .read<TogetherListBloc>()
                      .add(TogetherListChangeAgeFilter(age: age));
                  context.pop();
                },
                child: Center(
                  child: AppFont(
                    age.text,
                    color: age == context.read<TogetherListBloc>().state.age
                        ? Theme.of(context).primaryColor
                        : null,
                  ),
                ),
              ),
            AppInkButton(
              color: Colors.transparent,
              shadowColor: Colors.transparent,
              onTap: () {
                context
                    .read<TogetherListBloc>()
                    .add(TogetherListChangeAgeFilter(reset: true));
                context.pop();
              },
              child: const Center(
                child: AppFont(
                  '필터 초기화',
                  color: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapApply() {
    context.read<TogetherListBloc>().add(TogetherListApplyFilter());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TogetherListBloc, TogetherListState>(
      builder: (context, state) => Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size20,
                vertical: Sizes.size3,
              ),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AppInkButton(
                    onTap: _onTapAgeFilter,
                    color: state.age == null
                        ? Theme.of(context).scaffoldBackgroundColor
                        : null,
                    child: AppFont(
                      '연령 - ${state.age?.text ?? '필터 없음'}',
                      color: state.age == null ? null : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (!state.applyFilter)
            Padding(
              padding: const EdgeInsets.only(
                right: Sizes.size20,
                left: Sizes.size10,
              ),
              child: AppInkButton(
                onTap: _onTapApply,
                child: const AppFont(
                  '적용',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
