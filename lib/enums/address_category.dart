enum EAddressCategory {
  home('집'),
  work('회사'),
  school('학교'),
  etc('기타');

  final String text;

  const EAddressCategory(this.text);

  static String toJson(EAddressCategory? en) {
    if (en == null) {
      throw Exception('[EAddressCategory.toJson] Null value');
    }

    switch (en) {
      case EAddressCategory.home:
        return 'HOME';
      case EAddressCategory.work:
        return 'WORK';
      case EAddressCategory.school:
        return 'SCHOOL';
      case EAddressCategory.etc:
        return 'ETC';
    }
  }

  static EAddressCategory fromJson(String? str) {
    if (str == null) {
      throw Exception('[EAddressCategory.fromJson] Null value');
    }

    switch (str.toUpperCase()) {
      case 'HOME':
        return EAddressCategory.home;
      case 'WORK':
        return EAddressCategory.work;
      case 'SCHOOL':
        return EAddressCategory.school;
      case 'ETC':
        return EAddressCategory.etc;
      default:
        throw Exception(
            '[EAddressCategory.fromJson] Unknown string value: $str');
    }
  }
}

extension SAddressCategoryExtension on String {
  EAddressCategory get addressCategoryEnum {
    switch (this) {
      case '집':
        return EAddressCategory.home;
      case '회사':
        return EAddressCategory.work;
      case '학교':
        return EAddressCategory.school;
      case '기타':
        return EAddressCategory.etc;
      default:
        throw Exception(
            '[SAddressCategoryExtension.enumVal] Unknown string value: $this');
    }
  }
}

extension EAddressCategoryExtension on EAddressCategory {
  String get key {
    switch (this) {
      case EAddressCategory.home:
        return 'HOME';
      case EAddressCategory.work:
        return 'WORK';
      case EAddressCategory.school:
        return 'SCHOOL';
      case EAddressCategory.etc:
        return 'ETC';
    }
  }
}
