import 'package:child_goods_store_flutter/models/child/child_model.dart';

abstract class ChildEvent {}

class ChildGetChildren extends ChildEvent {}

class ChildAdd extends ChildEvent {
  final ChildModel child;

  ChildAdd(this.child);
}

class ChildEdit extends ChildEvent {
  final ChildModel child;

  ChildEdit(this.child);
}

class ChildSelect extends ChildEvent {
  final int childId;

  ChildSelect(this.childId);
}

class ChildGetProductList extends ChildEvent {}
