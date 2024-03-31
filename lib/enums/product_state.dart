enum EProductState {
  noUsage('새거에요'),
  littleUsage('조금 썼어요'),
  manyUsage('많이 썼어요'),
  extremeUsage('헌거에요');

  final String text;

  const EProductState(this.text);

  static String? toJson(EProductState? en) {
    switch (en) {
      case EProductState.noUsage:
        return 'NO_USAGE';
      case EProductState.littleUsage:
        return 'LITTLE_USAGE';
      case EProductState.manyUsage:
        return 'MANY_USAGE';
      case EProductState.extremeUsage:
        return 'EXTREME_USAGE';
      default:
        return null;
    }
  }

  static EProductState? fromJson(String? str) {
    switch (str?.toUpperCase()) {
      case 'NO_USAGE':
        return EProductState.noUsage;
      case 'LITTLE_USAGE':
        return EProductState.littleUsage;
      case 'MANY_USAGE':
        return EProductState.manyUsage;
      case 'EXTREME_USAGE':
        return EProductState.extremeUsage;
      default:
        return null;
    }
  }
}

extension SAddressCategoryExtension on String {
  EProductState get productStateEnum {
    switch (this) {
      case '새거에요':
        return EProductState.noUsage;
      case '조금 썼어요':
        return EProductState.littleUsage;
      case '많이 썼어요':
        return EProductState.manyUsage;
      case '헌거에요':
        return EProductState.extremeUsage;
      default:
        throw Exception('[EProductState.enumVal] Unknown string value: $this');
    }
  }
}

extension EProductStateExtension on EProductState {
  String get key {
    switch (this) {
      case EProductState.noUsage:
        return 'NO_USAGE';
      case EProductState.littleUsage:
        return 'LITTLE_USAGE';
      case EProductState.manyUsage:
        return 'MANY_USAGE';
      case EProductState.extremeUsage:
        return 'EXTREME_USAGE';
    }
  }
}
