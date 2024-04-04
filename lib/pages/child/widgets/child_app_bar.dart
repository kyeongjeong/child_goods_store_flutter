import 'package:child_goods_store_flutter/blocs/child/child_bloc.dart';
import 'package:child_goods_store_flutter/blocs/child/child_event.dart';
import 'package:child_goods_store_flutter/constants/routes.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/constants/strings.dart';
import 'package:child_goods_store_flutter/models/child/child_model.dart';
import 'package:child_goods_store_flutter/models/go_router_extra_model.dart';
import 'package:child_goods_store_flutter/widgets/common/v_icon_button.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_h_spliter.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChildAppBar extends StatelessWidget {
  final List<ChildModel> children;
  final ChildModel? selectedChild;

  const ChildAppBar({
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

  void _onTapAddChild(BuildContext context) {
    var res = context.push<GoRouterExtraModel<ChildModel>>(Routes.editChild);

    res.then((value) {
      if (value?.data != null) {
        context.read<ChildBloc>().add(ChildAdd(value!.data!));
      }
    });
  }

  void _onTapEditChild(BuildContext context) {
    var res = context.push<GoRouterExtraModel<ChildModel>>(
      Routes.editChild,
      extra: GoRouterExtraModel<ChildModel>(
        data: selectedChild,
      ),
    );

    res.then((value) {
      if (value?.data != null) {
        context.read<ChildBloc>().add(ChildEdit(value!.data!));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (var child in children)
                    Padding(
                      padding: const EdgeInsets.only(right: Sizes.size10),
                      child: VIconButton(
                        image: child.childImg,
                        title: child.name ?? Strings.nullStr,
                        onTap: () => _onTapSelectChild(
                          context,
                          childId: child.childId!,
                        ),
                        isSelected: child == selectedChild,
                      ),
                    ),
                  VIconButton(
                    icon: Icons.person_add_alt_1_rounded,
                    title: Strings.nullStr,
                    onTap: () => _onTapAddChild(context),
                    isSelected: true,
                  ),
                ],
              ),
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
                          vertical: Sizes.size4,
                          horizontal: Sizes.size10,
                        ),
                        child: const AppFont(
                          '자녀 정보 수정',
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
      ),
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
