enum EChildGender {
  man('남아'),
  woman('여아');

  final String text;

  const EChildGender(this.text);

  static String toJson(EChildGender? en) {
    if (en == null) {
      throw Exception('[EChildGender.toJson] Null value');
    }

    switch (en) {
      case EChildGender.man:
        return 'MAN';
      case EChildGender.woman:
        return 'WOMAN';
    }
  }

  static EChildGender fromJson(String? str) {
    if (str == null) {
      throw Exception('[EChildGender.fromJson] Null value');
    }

    switch (str.toUpperCase()) {
      case 'MAN':
        return EChildGender.man;
      case 'WOMAN':
        return EChildGender.woman;
      default:
        throw Exception('[EChildGender.fromJson] Unknown string value: $str');
    }
  }
}

extension EChildGenderExtension on EChildGender {
  String get key {
    switch (this) {
      case EChildGender.man:
        return 'MAN';
      case EChildGender.woman:
        return 'WOMAN';
    }
  }
}
