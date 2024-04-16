import 'package:child_goods_store_flutter/blocs/edit_review/edit_review_bloc.dart';
import 'package:child_goods_store_flutter/blocs/edit_review/edit_review_event.dart';
import 'package:child_goods_store_flutter/blocs/edit_review/edit_review_state.dart';
import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:child_goods_store_flutter/widgets/app_ink_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditReviewStars extends StatelessWidget {
  const EditReviewStars({super.key});

  void _onTapStar(
    BuildContext context, {
    required int score,
  }) {
    context.read<EditReviewBloc>().add(EditReviewChangeScore(score));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditReviewBloc, EditReviewState>(
      builder: (context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 1; i <= 5; i++)
            AppInkButton(
              color: Colors.transparent,
              shadowColor: Colors.transparent,
              onTap: () => _onTapStar(context, score: i),
              padding: const EdgeInsets.all(Sizes.size10),
              child: Icon(
                (state.review.score ?? 0) >= i
                    ? Icons.star_rounded
                    : Icons.star_border_rounded,
                size: Sizes.size32,
                color: Colors.yellow.shade700,
              ),
            ),
        ],
      ),
    );
  }
}
