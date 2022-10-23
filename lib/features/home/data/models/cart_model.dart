import 'package:inthekloud_shop_app/features/home/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({int? productID, int? quantity}) : super();

  CartModel.fromJson(Map<String, dynamic> json) {
    productID = json['productID'];
    quantity = json['quantity'];
  }

  static Map<String, dynamic> toJson(CartEntity music) =>
      {'productID': music.productID, 'quantity': music.quantity};
}
