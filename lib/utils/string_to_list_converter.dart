import 'package:child_goods_store_flutter/constants/strings.dart';

List<String> strToList(String? str) {
  if (str == null || str == Strings.nullStr) return [];
  List<String> res = [];
  for (var item in str.split(',')) {
    res.add(item);
  }
  return res;
}

String? listToStr(List<String> list) {
  if (list.isEmpty) return null;
  return list.join(',');
}
