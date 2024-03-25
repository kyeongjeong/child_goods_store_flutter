import 'package:child_goods_store_flutter/blocs/product/detail/product_detail_bloc.dart';
import 'package:child_goods_store_flutter/blocs/product/detail/product_detail_event.dart';
import 'package:child_goods_store_flutter/blocs/product/detail/product_detail_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailHeartWidget extends StatelessWidget {
  const ProductDetailHeartWidget({super.key});

  void _onTapHeart(BuildContext context) {
    context.read<ProductDetailBloc>().add(ProductDetailChangeHeart());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        if (state.productStatus != ELoadingStatus.loaded) {
          return Container();
        }
        return IconButton(
          onPressed: () => _onTapHeart(context),
          icon: Icon(
            state.productModel?.productHeart == true
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
          ),
        );
      },
    );
  }
}
