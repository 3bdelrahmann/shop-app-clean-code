part of 'product_details_bloc.dart';

abstract class ProductDetailsState extends Equatable {
  const ProductDetailsState();  

  @override
  List<Object> get props => [];
}
class ProductDetailsInitial extends ProductDetailsState {}
