import 'package:child_goods_store_flutter/blocs/abs_bloc_state.dart';
import 'package:child_goods_store_flutter/enums/loading_status.dart';
import 'package:child_goods_store_flutter/models/product/product_model.dart';
import 'package:child_goods_store_flutter/models/review/review_model.dart';
import 'package:child_goods_store_flutter/models/together/together_model.dart';

class EditReviewState extends BlocState {
  final ProductModel? targetProduct;
  final TogetherModel? targetTogether;
  final ELoadingStatus targetStatus;
  final ReviewModel review;
  final ELoadingStatus reviewStatus;

  const EditReviewState({
    this.targetProduct,
    this.targetTogether,
    required this.targetStatus,
    required this.review,
    required this.reviewStatus,
    required super.status,
    super.message,
  });

  EditReviewState.init({
    ReviewModel? review,
  })  : targetProduct = null,
        targetTogether = null,
        targetStatus = ELoadingStatus.init,
        review = review ?? ReviewModel(),
        reviewStatus = ELoadingStatus.init,
        super(
          status: ELoadingStatus.init,
          message: null,
        );

  @override
  EditReviewState copyWith({
    ELoadingStatus? status,
    String? message,
    ProductModel? targetProduct,
    TogetherModel? targetTogether,
    ELoadingStatus? targetStatus,
    ReviewModel? review,
    ELoadingStatus? reviewStatus,
  }) =>
      EditReviewState(
        status: status ?? this.status,
        message: message ?? this.message,
        targetProduct: targetProduct ?? this.targetProduct,
        targetTogether: targetTogether ?? this.targetTogether,
        targetStatus: targetStatus ?? this.targetStatus,
        review: review ?? this.review,
        reviewStatus: reviewStatus ?? this.reviewStatus,
      );

  @override
  List<Object?> get props => [
        targetProduct,
        targetTogether,
        targetStatus,
        review,
        reviewStatus,
        status,
        message,
      ];
}
