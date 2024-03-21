enum EProductStatus {
  noUsage('새거에요'),
  littleUsage('조금 썼어요'),
  manyUsage('많이 썼어요'),
  extremeUsage('헌거에요');

  final String text;

  const EProductStatus(this.text);

  static String toJson(EProductStatus? en) {
    if (en == null) {
      throw Exception('[EProductStatus.toJson] Null value');
    }

    switch (en) {
      case EProductStatus.noUsage:
        return 'NO_USAGE';
      case EProductStatus.littleUsage:
        return 'LITTLE_USAGE';
      case EProductStatus.manyUsage:
        return 'MANY_USAGE';
      case EProductStatus.extremeUsage:
        return 'EXTREME_USAGE';
    }
  }

  static EProductStatus fromJson(String? str) {
    if (str == null) {
      throw Exception('[EProductStatus.fromJson] Null value');
    }

    switch (str.toUpperCase()) {
      case 'NO_USAGE':
        return EProductStatus.noUsage;
      case 'LITTLE_USAGE':
        return EProductStatus.littleUsage;
      case 'MANY_USAGE':
        return EProductStatus.manyUsage;
      case 'EXTREME_USAGE':
        return EProductStatus.extremeUsage;
      default:
        throw Exception('[EProductStatus.fromJson] Unknown string value: $str');
    }
  }
}

extension EProductStatusExtension on EProductStatus {
  String get key {
    switch (this) {
      case EProductStatus.noUsage:
        return 'NO_USAGE';
      case EProductStatus.littleUsage:
        return 'LITTLE_USAGE';
      case EProductStatus.manyUsage:
        return 'MANY_USAGE';
      case EProductStatus.extremeUsage:
        return 'EXTREME_USAGE';
    }
  }
}
