import 'dart:io';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/models/go_router_extra_model.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class EditTogetherDeleteImageDialog extends StatelessWidget {
  final XFile? xfileImage;
  final String? networkImage;

  const EditTogetherDeleteImageDialog({
    super.key,
    this.xfileImage,
    this.networkImage,
  }) : assert(xfileImage != null || networkImage != null);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(Sizes.size20),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(Sizes.size10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
                Gaps.h10,
                AppFont(
                  '삭제할까요?',
                  fontSize: Sizes.size16,
                ),
              ],
            ),
            Gaps.v20,
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.size10),
              ),
              child: xfileImage == null
                  ? Image.network(
                      networkImage!,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      File(xfileImage!.path),
                      fit: BoxFit.cover,
                    ),
            ),
            Gaps.v20,
            Row(
              children: [
                Expanded(
                  child: AppInkButton(
                    color: Colors.white,
                    onTap: () {
                      context.pop();
                    },
                    child: const Center(
                      child: AppFont('취소'),
                    ),
                  ),
                ),
                Gaps.h10,
                Expanded(
                  child: AppInkButton(
                    color: Colors.white,
                    onTap: () {
                      context.pop<GoRouterExtraModel<bool>>(
                          const GoRouterExtraModel(
                        data: true,
                      ));
                    },
                    child: const Center(
                      child: AppFont(
                        '삭제',
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
