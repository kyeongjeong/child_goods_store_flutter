import 'package:child_goods_store_flutter/blocs/child/child_bloc.dart';
import 'package:child_goods_store_flutter/blocs/child/child_event.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/models/child/child_model.dart';
import 'package:child_goods_store_flutter/pages/child/widgets/child_icon_button.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_h_spliter.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChildListCard extends StatelessWidget {
  final List<ChildModel> children;
  final ChildModel? selectedChild;

  const ChildListCard({
    super.key,
    required this.children,
    this.selectedChild,
  });

  void _onTapSelectChild(
    BuildContext context, {
    required int childId,
  }) {
    context.read<ChildBloc>().add(ChildSelect(childId));
  }

  void _onTapAddChild(BuildContext context) {}

  void _onTapEditChild(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
            vertical: Sizes.size10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (var child in children)
                Padding(
                  padding: const EdgeInsets.only(right: Sizes.size10),
                  child: ChildIconButton(
                    child: child,
                    onTap: () => _onTapSelectChild(
                      context,
                      childId: child.childId!,
                    ),
                    isSelected: child == selectedChild,
                  ),
                ),
              SizedBox(
                width: Sizes.size64,
                height: Sizes.size64,
                child: AppInkButton(
                  borderRadSize: Sizes.size32,
                  onTap: () => _onTapAddChild(context),
                  child: const Icon(
                    Icons.person_add_alt_1_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (children.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppHSpliter(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size20,
                  vertical: Sizes.size10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppInkButton(
                      onTap: () => _onTapEditChild(context),
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size3,
                        horizontal: Sizes.size10,
                      ),
                      child: const AppFont(
                        '자녀 정보수정',
                        color: Colors.white,
                      ),
                    ),
                    for (var tag in selectedChild?.tag ?? [])
                      Padding(
                        padding: const EdgeInsets.only(left: Sizes.size10),
                        child: _tag(context, tag: tag),
                      ),
                  ],
                ),
              ),
            ],
          ),
        const AppHSpliter(),
      ],
    );
  }

  Widget _tag(
    BuildContext context, {
    required String tag,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size3,
        horizontal: Sizes.size10,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(Sizes.size10),
      ),
      child: AppFont(tag),
    );
  }
}
