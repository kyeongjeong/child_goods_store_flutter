import 'package:child_goods_store_flutter/enums/product_sale_status.dart';

abstract class ProductDetailEvent {}

class ProductDetailGet extends ProductDetailEvent {}

class ProductDetailChangeSaleStatus extends ProductDetailEvent {
  final EProductSaleStatus status;
  final int? userId;

  ProductDetailChangeSaleStatus(
    this.status, {
    this.userId,
  });
}

class ProductDetailChangeHeart extends ProductDetailEvent {}
