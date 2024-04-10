import 'package:child_goods_store_flutter/blocs/profile/profile_tab_bloc.dart';
import 'package:child_goods_store_flutter/blocs/profile/profile_tab_event.dart';
import 'package:child_goods_store_flutter/blocs/profile/profile_tab_state.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/enums/chat_item_type.dart';
import 'package:child_goods_store_flutter/widgets/app_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTabCategoryDropdown extends StatelessWidget {
  const ProfileTabCategoryDropdown({super.key});

  void _onChangeCategory(
    BuildContext context, {
    String? category,
  }) {
    if (category == null) return;
    context.read<ProfileTabBloc>().add(ProfileTabChangeCategory(
          category.chatItemTypeEnum,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileTabBloc, ProfileTabState>(
      builder: (context, state) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size20),
          child: AppDropdown(
            width: double.infinity,
            hint: '카테고리',
            value: state.category.text,
            values: EChatItemType.values.map((cat) => cat.text).toList(),
            onChanged: (value) => _onChangeCategory(
              context,
              category: value,
            ),
          ),
        ),
      ),
    );
  }
}
