enum EProductSaleStatus {
  sale('판매 중'),
  reserved('예약 중'),
  soldout('판매 완료');

  final String text;

  const EProductSaleStatus(this.text);

  static String? toJson(EProductSaleStatus? en) {
    switch (en) {
      case EProductSaleStatus.sale:
        return 'SALE';
      case EProductSaleStatus.reserved:
        return 'RESERVED';
      case EProductSaleStatus.soldout:
        return 'SOLDOUT';
      default:
        return null;
    }
  }

  static EProductSaleStatus? fromJson(String? str) {
    switch (str?.toUpperCase()) {
      case 'SALE':
        return EProductSaleStatus.sale;
      case 'RESERVED':
        return EProductSaleStatus.reserved;
      case 'SOLDOUT':
        return EProductSaleStatus.soldout;
      default:
        return null;
    }
  }
}

extension EProductSaleStatusExtension on EProductSaleStatus {
  String get key {
    switch (this) {
      case EProductSaleStatus.sale:
        return 'SALE';
      case EProductSaleStatus.reserved:
        return 'RESERVED';
      case EProductSaleStatus.soldout:
        return 'SOLDOUT';
    }
  }
}
