import 'dart:io';
import 'package:child_goods_store_flutter/blocs/edit_product/edit_product_bloc.dart';
import 'package:child_goods_store_flutter/blocs/edit_product/edit_product_event.dart';
import 'package:child_goods_store_flutter/blocs/edit_product/edit_product_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/models/go_router_extra_model.dart';
import 'package:child_goods_store_flutter/pages/edit_product/widgets/edit_product_delete_image_dialog.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProductImage extends StatefulWidget {
  const EditProductImage({super.key});

  @override
  State<EditProductImage> createState() => _EditProductImageState();
}

class _EditProductImageState extends State<EditProductImage> {
  void _onTapSelectImage() async {
    final picker = ImagePicker();
    final images = await picker.pickMultiImage();
    if (mounted) {
      context.read<EditProductBloc>().add(EditProductAddImage(images));
    }
  }

  void _onDeleteXFileImage({
    required int index,
    required XFile xfile,
  }) async {
    var res = await showDialog<GoRouterExtraModel<bool>>(
      context: context,
      builder: (context) => EditProductDeleteImageDialog(
        xfileImage: xfile,
      ),
    );

    if (mounted && res?.data == true) {
      context.read<EditProductBloc>().add(EditProductDeleteXFileImage(index));
    }
  }

  void _onDeleteNetworkImage({
    required int index,
    required String url,
  }) async {
    var res = await showDialog<GoRouterExtraModel<bool>>(
      context: context,
      builder: (context) => EditProductDeleteImageDialog(
        networkImage: url,
      ),
    );

    if (mounted && res?.data == true) {
      context.read<EditProductBloc>().add(EditProductDeleteNetworkImage(index));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProductBloc, EditProductState>(
      buildWhen: (previous, current) =>
          previous.product.productImage != current.product.productImage ||
          previous.newImage != current.newImage,
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
            child: AppFont(
              '상품 사진',
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gaps.v10,
          SizedBox(
            height: Sizes.size96,
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: [
                SliverToBoxAdapter(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: _onTapSelectImage,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Sizes.size20),
                      child: Icon(
                        Icons.add_photo_alternate_rounded,
                        size: Sizes.size60,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                if (state.newImage.isEmpty &&
                    state.product.productImage.isEmpty)
                  SliverToBoxAdapter(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: _onTapSelectImage,
                      child: const Center(
                        child: AppFont('이미지를 추가할 수 있습니다.'),
                      ),
                    ),
                  ),
                SliverList.separated(
                  itemBuilder: (context, index) {
                    var idx = state.newImage.length - index - 1;
                    return _imageContainer(
                      onTap: () => _onDeleteXFileImage(
                        index: idx,
                        xfile: state.newImage[idx],
                      ),
                      child: Image.file(
                        File(state.newImage[idx].path),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Gaps.h10,
                  itemCount: state.newImage.length,
                ),
                if (state.newImage.isNotEmpty)
                  const SliverToBoxAdapter(child: Gaps.h10),
                SliverList.separated(
                  itemBuilder: (context, index) {
                    var idx = state.product.productImage.length - index - 1;
                    return _imageContainer(
                      onTap: () => _onDeleteNetworkImage(
                        index: idx,
                        url: state.product.productImage[idx],
                      ),
                      child: Image.network(
                        state.product.productImage[idx],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Gaps.h10,
                  itemCount: state.product.productImage.length,
                ),
                if (state.product.productImage.isNotEmpty)
                  const SliverToBoxAdapter(child: Gaps.h10),
                const SliverToBoxAdapter(child: Gaps.h10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageContainer({
    required Widget child,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.size3),
      child: AppInkButton(
        padding: EdgeInsets.zero,
        onTap: onTap,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            child,
            Container(
              padding: const EdgeInsets.all(Sizes.size2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(Sizes.size10),
                ),
              ),
              child: const Icon(
                Icons.delete,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
