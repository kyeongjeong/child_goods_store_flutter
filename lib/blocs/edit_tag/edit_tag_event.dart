abstract class EditTagEvent {}

class EditTagChangeQuery extends EditTagEvent {
  final String query;

  EditTagChangeQuery(this.query);
}

class EditTagAdd extends EditTagEvent {
  final String tag;

  EditTagAdd(this.tag);
}

class EditTagRemove extends EditTagEvent {
  final String tag;

  EditTagRemove(this.tag);
}
