part of 'product_details_bloc.dart';

abstract class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

class ProductDetailsInitial extends ProductDetailsState {}

class GetProductsByIDLoading extends ProductDetailsState {}

class GetProductsByIDSuccess extends ProductDetailsState {
  const GetProductsByIDSuccess({required this.product});
  final ProductsEntity product;

  @override
  List<Object> get props => [product];
}

class GetProductsByIDFailed extends ProductDetailsState {
  const GetProductsByIDFailed({required this.failureObject});
  final Failure failureObject;

  @override
  List<Object> get props => [failureObject];
}
