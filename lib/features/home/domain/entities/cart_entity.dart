import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  int? productID;
  int? quantity;

  CartEntity({this.productID, this.quantity});

  @override
  List<Object?> get props => [productID, quantity];
}
