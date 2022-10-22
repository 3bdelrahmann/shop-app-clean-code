import 'package:equatable/equatable.dart';
import 'package:inthekloud_shop_app/features/home/data/models/products_model.dart';

class CartEntity extends Equatable {
  List<ProductsModel>? products;
  String? userId;

  CartEntity({this.products, this.userId});

  @override
  List<Object?> get props => [products, userId];
}
