enum EProductSaleStatus {
  sale('sale', '판매 중'),
  reserved('reserved', '예약 중'),
  soldout('soldout', '판매 완료');

  final String key;
  final String text;

  const EProductSaleStatus(
    this.key,
    this.text,
  );
}
