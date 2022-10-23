part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetCategories extends HomeEvent {
  const GetCategories();
}

class GetProductsByCategoryName extends HomeEvent {
  final String category;
  const GetProductsByCategoryName({required this.category});

  @override
  List<Object> get props => [category];
}

class GetAllProducts extends HomeEvent {
  const GetAllProducts();
}

class UserLogout extends HomeEvent {
  final BuildContext context;

  const UserLogout({required this.context});

  @override
  List<Object> get props => [context];
}

class AddToCart extends HomeEvent {
  final List<CartModel> cart;

  const AddToCart({required this.cart});

  @override
  List<Object> get props => [cart];
}
