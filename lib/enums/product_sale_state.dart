enum EProductSaleState {
  sale('판매 중'),
  reserved('예약 중'),
  soldout('판매 완료');

  final String text;

  const EProductSaleState(this.text);

  static String? toJson(EProductSaleState? en) {
    switch (en) {
      case EProductSaleState.sale:
        return 'SALE';
      case EProductSaleState.reserved:
        return 'RESERVED';
      case EProductSaleState.soldout:
        return 'SOLDOUT';
      default:
        return null;
    }
  }

  static EProductSaleState? fromJson(String? str) {
    switch (str?.toUpperCase()) {
      case 'SALE':
        return EProductSaleState.sale;
      case 'RESERVED':
        return EProductSaleState.reserved;
      case 'SOLDOUT':
        return EProductSaleState.soldout;
      default:
        return null;
    }
  }
}

extension EProductSaleStateExtension on EProductSaleState {
  String get key {
    switch (this) {
      case EProductSaleState.sale:
        return 'SALE';
      case EProductSaleState.reserved:
        return 'RESERVED';
      case EProductSaleState.soldout:
        return 'SOLDOUT';
    }
  }
}
