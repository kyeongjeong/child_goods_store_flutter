import 'package:child_goods_store_flutter/blocs/edit_together/edit_together_bloc.dart';
import 'package:child_goods_store_flutter/blocs/edit_together/edit_together_event.dart';
import 'package:child_goods_store_flutter/blocs/edit_together/edit_together_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/routes.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/models/go_router_extra_model.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditTogetherTag extends StatefulWidget {
  const EditTogetherTag({super.key});

  @override
  State<EditTogetherTag> createState() => _EditTogetherTagState();
}

class _EditTogetherTagState extends State<EditTogetherTag> {
  void _onTapEditTag() async {
    var tags = context.read<EditTogetherBloc>().state.together.tag;
    var resTags = await context.push<GoRouterExtraModel<List<String>>>(
      Routes.editTag,
      extra: GoRouterExtraModel<List<String>>(
        data: tags,
      ),
    );

    if (resTags?.data != null && mounted) {
      context
          .read<EditTogetherBloc>()
          .add(EditTogetherChangeTags(resTags!.data!));
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
          BlocBuilder<EditTogetherBloc, EditTogetherState>(
            buildWhen: (previous, current) =>
                previous.together.tag != current.together.tag,
            builder: (context, state) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var tag in state.together.tag) _tag(context, tag: tag),
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
