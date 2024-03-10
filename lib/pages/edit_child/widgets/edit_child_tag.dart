import 'package:child_goods_store_flutter/blocs/edit_child/edit_child_bloc.dart';
import 'package:child_goods_store_flutter/blocs/edit_child/edit_child_event.dart';
import 'package:child_goods_store_flutter/blocs/edit_child/edit_child_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/routes.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/models/go_router_extra_model.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditChildTag extends StatefulWidget {
  const EditChildTag({super.key});

  @override
  State<EditChildTag> createState() => _EditChildTagState();
}

class _EditChildTagState extends State<EditChildTag> {
  void _onTapEditTag() async {
    var tags = context.read<EditChildBloc>().state.child.tag;
    var resTags = await context.push<GoRouterExtraModel<List<String>>>(
      Routes.editTag,
      extra: GoRouterExtraModel<List<String>>(
        data: tags,
      ),
    );

    if (resTags?.data != null && mounted) {
      context.read<EditChildBloc>().add(EditChildChangeTag(resTags!.data!));
    }
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
                '태그',
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
          Gaps.v10,
          BlocBuilder<EditChildBloc, EditChildState>(
            builder: (context, state) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var tag in state.child.tag) _tag(context, tag: tag),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tag(
    BuildContext context, {
    required String tag,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: Sizes.size5),
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
