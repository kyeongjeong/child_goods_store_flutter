import 'dart:io';

import 'package:child_goods_store_flutter/blocs/edit_child/edit_child_bloc.dart';
import 'package:child_goods_store_flutter/blocs/edit_child/edit_child_event.dart';
import 'package:child_goods_store_flutter/blocs/edit_child/edit_child_state.dart';
import 'package:child_goods_store_flutter/constants/gaps.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/pages/edit_child/widgets/edit_child_age.dart';
import 'package:child_goods_store_flutter/pages/edit_child/widgets/edit_child_gender.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:child_goods_store_flutter/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditChildPage extends StatefulWidget {
  const EditChildPage({super.key});

  @override
  State<EditChildPage> createState() => _EditChildPageState();
}

class _EditChildPageState extends State<EditChildPage> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: context.read<EditChildBloc>().state.child.name,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _onTapSelectImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null && mounted) {
      context.read<EditChildBloc>().add(EditChildChangeImage(image));
    }
  }

  void _onTapRemoveImage() {
    context.read<EditChildBloc>().add(EditChildChangeImage(null));
  }

  void _onNameChange(String name) {
    context.read<EditChildBloc>().add(EditChildChangeName(name));
  }

  void _onTapComplete() {
    context.read<EditChildBloc>().add(EditChildSubmit());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppFont(
            '자녀 정보 수정 - ${context.read<EditChildBloc>().httpMethod.toString()}'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      BlocBuilder<EditChildBloc, EditChildState>(
                        builder: (context, state) => GestureDetector(
                          onTap: _onTapSelectImage,
                          child: Container(
                            width: Sizes.size80,
                            height: Sizes.size80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor,
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: _profileImageSelector(state),
                          ),
                        ),
                      ),
                      IgnorePointer(
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: Sizes.size32,
                          shadows: [
                            Shadow(
                              color: Theme.of(context).shadowColor,
                              blurRadius: Sizes.size5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gaps.h20,
                  AppInkButton(
                    onTap: _onTapRemoveImage,
                    child: const AppFont(
                      '사진 지우기',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Gaps.v20,
              AppTextFormField(
                hintText: '이름',
                controller: _nameController,
                onChange: _onNameChange,
              ),
              Gaps.v20,
              const EditChildGender(),
              Gaps.v20,
              const EditChildAge(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<EditChildBloc, EditChildState>(
        builder: (context, state) {
          return AppInkButton(
            onTap:
                state.status == ELoadingStatus.loading ? null : _onTapComplete,
            borderRadSize: 0,
            child: Container(
              width: double.infinity,
              height: Sizes.size32,
              margin: EdgeInsets.only(
                bottom: MediaQuery.paddingOf(context).bottom,
              ),
              child: Center(
                child: state.status == ELoadingStatus.loading
                    ? const SizedBox(
                        width: Sizes.size28,
                        height: Sizes.size28,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const AppFont(
                        '저장',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _profileImageSelector(EditChildState state) {
    if (state.removeImage) {
      return const Icon(
        Icons.person,
        size: Sizes.size60,
        color: Colors.white,
      );
    }
    if (state.image != null) {
      return Image.file(
        File(state.image!.path),
        fit: BoxFit.cover,
      );
    }
    if (state.child.childImg?.isNotEmpty == true) {
      return Image.network(
        state.child.childImg!,
        fit: BoxFit.cover,
      );
    }
    return const Icon(
      Icons.person,
      size: Sizes.size60,
      color: Colors.white,
    );
  }
}
