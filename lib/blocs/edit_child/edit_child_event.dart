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
  final String gender;

  /// gender: M or W
  EditChildChangeGender(this.gender);
}

class EditChildChangeAge extends EditChildEvent {
  final int age;

  /// age: month unit
  EditChildChangeAge(this.age);
}

class EditChildChangeTag extends EditChildEvent {
  final List<String> tag;

  EditChildChangeTag(this.tag);
}

class EditChildSubmit extends EditChildEvent {}
