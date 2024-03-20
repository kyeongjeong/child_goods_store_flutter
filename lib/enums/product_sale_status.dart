enum EProductSaleStatus {
  sale('판매 중'),
  reserved('예약 중'),
  soldout('판매 완료');

  final String text;

  const EProductSaleStatus(this.text);

  static String toJson(EProductSaleStatus? en) {
    if (en == null) {
      throw Exception('[EProductSaleStatusExtension.toJson] Null value');
    }

    switch (en) {
      case EProductSaleStatus.sale:
        return 'SALE';
      case EProductSaleStatus.reserved:
        return 'RESERVED';
      case EProductSaleStatus.soldout:
        return 'SOLDOUT';
    }
  }

  static EProductSaleStatus fromJson(String? str) {
    if (str == null) {
      throw Exception('[EProductSaleStatusExtension.fromJson] Null value');
    }

    switch (str.toUpperCase()) {
      case 'SALE':
        return EProductSaleStatus.sale;
      case 'RESERVED':
        return EProductSaleStatus.reserved;
      case 'SOLDOUT':
        return EProductSaleStatus.soldout;
      default:
        throw Exception(
            '[EProductSaleStatusExtension.fromJson] Unknown string value: $str');
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
