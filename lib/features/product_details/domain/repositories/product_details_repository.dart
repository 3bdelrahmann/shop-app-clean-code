import 'package:dartz/dartz.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/products_entity.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure, ProductsEntity>>? getProductsByID(String productID);
}
