import 'package:child_goods_store_flutter/blocs/app_data/app_data_bloc.dart';
import 'package:child_goods_store_flutter/blocs/app_data/app_data_state.dart';
import 'package:child_goods_store_flutter/constants/routes.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/pages/ship/widgets/ship_card.dart';
import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ShipPage extends StatelessWidget {
  const ShipPage({super.key});

  void _onAddTap(BuildContext context) {
    context.push(Routes.editAddress);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppFont('배송지 설정'),
        centerTitle: false,
      ),
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<AppDataBloc, AppDataState>(
        builder: (context, state) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var address in state.addresses) ShipCard(address: address),
                AppInkButton(
                  onTap: () => _onAddTap(context),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: const Icon(
                    Icons.add_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
