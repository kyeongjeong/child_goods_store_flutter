enum EChildAge {
  age6('0 ~ 6개월'),
  age12('7 ~ 12개월'),
  age24('13 ~ 24개월'),
  age60('3살 ~ 5살'),
  age96('6살 ~ 8살'),
  age108('9세 이상');

  final String text;

  const EChildAge(this.text);

  static String? toJson(EChildAge? en) {
    switch (en) {
      case EChildAge.age6:
        return 'AGE_6';
      case EChildAge.age12:
        return 'AGE_12';
      case EChildAge.age24:
        return 'AGE_24';
      case EChildAge.age60:
        return 'AGE_60';
      case EChildAge.age96:
        return 'AGE_96';
      case EChildAge.age108:
        return 'AGE_108';
      default:
        return null;
    }
  }

  static EChildAge? fromJson(String? str) {
    switch (str?.toUpperCase()) {
      case 'AGE_6':
        return EChildAge.age6;
      case 'AGE_12':
        return EChildAge.age12;
      case 'AGE_24':
        return EChildAge.age24;
      case 'AGE_60':
        return EChildAge.age60;
      case 'AGE_96':
        return EChildAge.age96;
      case 'AGE_108':
        return EChildAge.age108;
      default:
        return null;
    }
  }
}

extension SChildAgeExtension on String {
  EChildAge get childAgeEnum {
    switch (this) {
      case '0 ~ 6개월':
        return EChildAge.age6;
      case '7 ~ 12개월':
        return EChildAge.age12;
      case '13 ~ 24개월':
        return EChildAge.age24;
      case '3살 ~ 5살':
        return EChildAge.age60;
      case '6살 ~ 8살':
        return EChildAge.age96;
      case '9세 이상':
        return EChildAge.age108;
      default:
        throw Exception(
            '[SChildAgeExtension.enumVal] Unknown string value: $this');
    }
  }
}

extension EChildAgeExtension on EChildAge {
  String get key {
    switch (this) {
      case EChildAge.age6:
        return 'AGE_6';
      case EChildAge.age12:
        return 'AGE_12';
      case EChildAge.age24:
        return 'AGE_24';
      case EChildAge.age60:
        return 'AGE_60';
      case EChildAge.age96:
        return 'AGE_96';
      case EChildAge.age108:
        return 'AGE_108';
    }
  }
}
