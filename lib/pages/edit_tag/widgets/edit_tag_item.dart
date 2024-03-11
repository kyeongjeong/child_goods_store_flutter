import 'package:child_goods_store_flutter/blocs/edit_tag/edit_tag_bloc.dart';
import 'package:child_goods_store_flutter/blocs/edit_tag/edit_tag_event.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditTagItem extends StatelessWidget {
  final String tag;

  const EditTagItem({
    super.key,
    required this.tag,
  });

  void _onTap(BuildContext context) {
    context.read<EditTagBloc>().add(EditTagRemove(tag));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: Sizes.size5),
      child: AppInkButton(
        onTap: () => _onTap(context),
        padding: const EdgeInsets.all(Sizes.size3),
        borderRadSize: Sizes.size20,
        child: Row(
          children: [
            const Icon(
              Icons.remove_circle_rounded,
              color: Colors.white,
            ),
            Gaps.h5,
            AppFont(
              tag,
              color: Colors.white,
            ),
            Gaps.h10,
          ],
        ),
      ),
    );
  }
}
