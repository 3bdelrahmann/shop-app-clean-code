part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class GetCategoriesSuccess extends HomeState {
  const GetCategoriesSuccess();
}

class GetCategoriesFailed extends HomeState {
  const GetCategoriesFailed({required this.failureObject});
  final Failure failureObject;

  @override
  List<Object> get props => [failureObject];
}

class GetAllProductsSuccess extends HomeState {
  const GetAllProductsSuccess({required this.products});
  final List<ProductsEntity> products;

  @override
  List<Object> get props => [products];
}

class GetAllProductsFailed extends HomeState {
  const GetAllProductsFailed({required this.failureObject});
  final Failure failureObject;

  @override
  List<Object> get props => [failureObject];
}

class GetProductsByCategoryNameLoading extends HomeState {}

class GetProductsByCategoryNameSuccess extends HomeState {
  const GetProductsByCategoryNameSuccess({required this.products});
  final List<ProductsEntity> products;

  @override
  List<Object> get props => [products];
}

class GetProductsByCategoryNameFailed extends HomeState {
  const GetProductsByCategoryNameFailed({required this.failureObject});
  final Failure failureObject;

  @override
  List<Object> get props => [failureObject];
}

class UserLogoutLoading extends HomeState {}

class UserLogoutSuccess extends HomeState {}

class UserLogoutFailed extends HomeState {
  const UserLogoutFailed({required this.failureObject});
  final Failure failureObject;

  @override
  List<Object> get props => [failureObject];
}

class AddToCartLoading extends HomeState {}

class AddToCartSuccess extends HomeState {}

class AddToCartFailed extends HomeState {
  const AddToCartFailed({required this.failureObject});
  final Failure failureObject;

  @override
  List<Object> get props => [failureObject];
}
