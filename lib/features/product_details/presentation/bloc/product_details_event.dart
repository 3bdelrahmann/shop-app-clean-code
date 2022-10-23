part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetProductsByID extends ProductDetailsEvent {
  final String productID;
  const GetProductsByID({required this.productID});

  @override
  List<Object> get props => [productID];
}
