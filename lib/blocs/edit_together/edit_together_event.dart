import 'package:child_goods_store_flutter/enums/child_age.dart';
import 'package:child_goods_store_flutter/enums/main_category.dart';
import 'package:child_goods_store_flutter/enums/sub_category.dart';
import 'package:image_picker/image_picker.dart';

abstract class EditTogetherEvent {}

class EditTogetherAddImage extends EditTogetherEvent {
  final List<XFile> images;

  EditTogetherAddImage(this.images);
}

class EditTogetherDeleteXFileImage extends EditTogetherEvent {
  final int index;

  EditTogetherDeleteXFileImage(this.index);
}

class EditTogetherDeleteNetworkImage extends EditTogetherEvent {
  final int index;

  EditTogetherDeleteNetworkImage(this.index);
}

class EditTogetherChangeName extends EditTogetherEvent {
  final String togetherName;

  EditTogetherChangeName(this.togetherName);
}

class EditTogetherChangeDetails extends EditTogetherEvent {
  final String details;

  EditTogetherChangeDetails(this.details);
}

class EditTogetherChangeMainCat extends EditTogetherEvent {
  final EMainCategory mainCategory;

  EditTogetherChangeMainCat(this.mainCategory);
}

class EditTogetherChangeSubCat extends EditTogetherEvent {
  final ESubCategory subCategory;

  EditTogetherChangeSubCat(this.subCategory);
}

class EditTogetherChangeAge extends EditTogetherEvent {
  final EChildAge? age;

  EditTogetherChangeAge(this.age);
}

class EditTogetherChangeTags extends EditTogetherEvent {
  final List<String> tag;

  EditTogetherChangeTags(this.tag);
}

class EditTogetherChangeLink extends EditTogetherEvent {
  final String link;

  EditTogetherChangeLink(this.link);
}

class EditTogetherChangeTotalPrice extends EditTogetherEvent {
  final int totalPrice;

  EditTogetherChangeTotalPrice(this.totalPrice);
}

class EditTogetherChangeTotalNum extends EditTogetherEvent {
  final int totalNum;

  EditTogetherChangeTotalNum(this.totalNum);
}

class EditTogetherChangeDeadline extends EditTogetherEvent {
  final DateTime deadline;

  EditTogetherChangeDeadline(this.deadline);
}

class EditTogetherChangeAddress extends EditTogetherEvent {
  final String address;

  EditTogetherChangeAddress(this.address);
}

class EditTogetherChangeDetailAddress extends EditTogetherEvent {
  final String detailAddress;

  EditTogetherChangeDetailAddress(this.detailAddress);
}

class EditTogetherSubmit extends EditTogetherEvent {}
