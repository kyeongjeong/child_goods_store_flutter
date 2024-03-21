enum ESearchRange {
  all('전체'),
  myRegion('내 동네');

  final String text;

  const ESearchRange(this.text);

  static String? toJson(ESearchRange? en) {
    switch (en) {
      case ESearchRange.all:
        return 'ALL';
      case ESearchRange.myRegion:
        return 'MY_REGION';
      default:
        return null;
    }
  }

  static ESearchRange? fromJson(String? str) {
    switch (str?.toUpperCase()) {
      case 'ALL':
        return ESearchRange.all;
      case 'MY_REGION':
        return ESearchRange.myRegion;
      default:
        return null;
    }
  }
}

extension SSearchRangeExtension on String {
  ESearchRange get searchRangeEnum {
    switch (this) {
      case '전체':
        return ESearchRange.all;
      case '내 동네':
        return ESearchRange.myRegion;
      default:
        throw Exception(
            '[SSearchRangeExtension.enumVal] Unknown string value: $this');
    }
  }
}

extension ESearchRangeExtension on ESearchRange {
  String get key {
    switch (this) {
      case ESearchRange.all:
        return 'ALL';
      case ESearchRange.myRegion:
        return 'MY_REGION';
    }
  }
}
