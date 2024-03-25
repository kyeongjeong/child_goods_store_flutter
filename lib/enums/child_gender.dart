enum EChildGender {
  man('남아'),
  woman('여아');

  final String text;

  const EChildGender(this.text);

  static String? toJson(EChildGender? en) {
    switch (en) {
      case EChildGender.man:
        return 'MAN';
      case EChildGender.woman:
        return 'WOMAN';
      default:
        return null;
    }
  }

  static EChildGender? fromJson(String? str) {
    switch (str?.toUpperCase()) {
      case 'MAN':
        return EChildGender.man;
      case 'WOMAN':
        return EChildGender.woman;
      default:
        return null;
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
