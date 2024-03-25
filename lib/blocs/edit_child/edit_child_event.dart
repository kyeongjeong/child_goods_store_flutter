import 'package:child_goods_store_flutter/enums/child_age.dart';
import 'package:child_goods_store_flutter/enums/child_gender.dart';
import 'package:image_picker/image_picker.dart';

abstract class EditChildEvent {}

/// image == null -> remove image
class EditChildChangeImage extends EditChildEvent {
  final XFile? image;

  EditChildChangeImage(this.image);
}

class EditChildChangeName extends EditChildEvent {
  final String name;

  EditChildChangeName(this.name);
}

class EditChildChangeGender extends EditChildEvent {
  final EChildGender gender;

  EditChildChangeGender(this.gender);
}

class EditChildChangeAge extends EditChildEvent {
  final EChildAge age;

  EditChildChangeAge(this.age);
}

class EditChildChangeTag extends EditChildEvent {
  final List<String> tag;

  EditChildChangeTag(this.tag);
}

class EditChildSubmit extends EditChildEvent {}
