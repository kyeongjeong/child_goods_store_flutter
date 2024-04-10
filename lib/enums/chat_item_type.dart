enum EChatItemType {
  product('중고거래'),
  together('공동구매');

  final String text;

  const EChatItemType(this.text);

  static String? toJson(EChatItemType? en) {
    switch (en) {
      case EChatItemType.product:
        return 'PRODUCT';
      case EChatItemType.together:
        return 'TOGETHER';
      default:
        return null;
    }
  }

  static EChatItemType? fromJson(String? str) {
    switch (str?.toUpperCase()) {
      case 'PRODUCT':
        return EChatItemType.product;
      case 'TOGETHER':
        return EChatItemType.together;
      default:
        return null;
    }
  }
}

extension SChatItemTypeExtension on String {
  EChatItemType get chatItemTypeEnum {
    switch (this) {
      case '중고거래':
        return EChatItemType.product;
      case '공동구매':
        return EChatItemType.together;
      default:
        throw Exception(
            '[SChatItemTypeExtension.enumVal] Unknown string value: $this');
    }
  }
}

extension EChatItemTypeExtension on EChatItemType {
  String get key {
    switch (this) {
      case EChatItemType.product:
        return 'PRODUCT';
      case EChatItemType.together:
        return 'TOGETHER';
    }
  }
}
