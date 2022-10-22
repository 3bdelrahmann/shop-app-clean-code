import 'package:inthekloud_shop_app/features/home/data/models/products_model.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({List<ProductsModel>? products, String? userId})
      : super(products: products, userId: userId);

  CartModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductsModel>[];
      json['products'].forEach((v) {
        products!.add(ProductsModel.fromJson(v));
      });
    }
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['userId'] = userId;
    return data;
  }
}
