import 'package:dartz/dartz.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/core/use_cases/usecase.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/cart_entity.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/get_products_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<dynamic>>>? getCategories(NoParams params);
  Future<Either<Failure, GetProductsEntity>>? getAllProducts(NoParams params);
  Future<Either<Failure, GetProductsEntity>>? getProductsByCategoryName(
      String category);
  Future<Either<Failure, bool>>? userLogout(NoParams params);

  Future<Either<Failure, bool>>? addToCart(List<CartEntity> cart);
}
