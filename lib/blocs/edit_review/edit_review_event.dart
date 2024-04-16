abstract class EditReviewEvent {}

class EditReviewGetItem extends EditReviewEvent {}

class EditReviewChangeScore extends EditReviewEvent {
  final int score;

  EditReviewChangeScore(this.score);
}

class EditReviewChangeContent extends EditReviewEvent {
  final String content;

  EditReviewChangeContent(this.content);
}

class EditReviewSubmit extends EditReviewEvent {}
