import 'package:child_goods_store_flutter/enums/child_age.dart';
import 'package:child_goods_store_flutter/enums/main_category.dart';
import 'package:child_goods_store_flutter/enums/product_state.dart';
import 'package:child_goods_store_flutter/enums/sub_category.dart';
import 'package:image_picker/image_picker.dart';

abstract class EditProductEvent {}

class EditProductAddImage extends EditProductEvent {
  final List<XFile> images;

  EditProductAddImage(this.images);
}

class EditProductDeleteXFileImage extends EditProductEvent {
  final int index;

  EditProductDeleteXFileImage(this.index);
}

class EditProductDeleteNetworkImage extends EditProductEvent {
  final int index;

  EditProductDeleteNetworkImage(this.index);
}

class EditProductChangeName extends EditProductEvent {
  final String productName;

  EditProductChangeName(this.productName);
}

class EditProductChangeContent extends EditProductEvent {
  final String content;

  EditProductChangeContent(this.content);
}

class EditProductChangeMainCat extends EditProductEvent {
  final EMainCategory mainCategory;

  EditProductChangeMainCat(this.mainCategory);
}

class EditProductChangeSubCat extends EditProductEvent {
  final ESubCategory subCategory;

  EditProductChangeSubCat(this.subCategory);
}

class EditProductChangeAge extends EditProductEvent {
  final EChildAge? age;

  EditProductChangeAge(this.age);
}

class EditProductChangeTags extends EditProductEvent {
  final List<String> tag;

  EditProductChangeTags(this.tag);
}

class EditProductChangePrice extends EditProductEvent {
  final int price;

  EditProductChangePrice(this.price);
}

class EditProductChangeState extends EditProductEvent {
  final EProductState productState;

  EditProductChangeState(this.productState);
}

class EditProductSubmit extends EditProductEvent {}
