import 'package:dartz/dartz.dart';
import 'package:inthekloud_shop_app/core/error/exception.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/core/use_cases/usecase.dart';
import 'package:inthekloud_shop_app/features/home/data/datasources/home_local_data_source.dart';
import 'package:inthekloud_shop_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/cart_entity.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/get_products_entity.dart';
import 'package:inthekloud_shop_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  HomeRepositoryImp({
    required this.localDataSources,
    required this.remoteDataSources,
  });

  final HomeRemoteDataSources remoteDataSources;
  final HomeLocalDataSources localDataSources;

  @override
  Future<Either<Failure, List<dynamic>>>? getCategories(NoParams params) async {
    try {
      final categories = await remoteDataSources.getCategories();
      List<dynamic> categoriesList = categories['categories']!.toList();

      return Right(categoriesList);
    } on UnknownServerException {
      return const Left(ServerFailure());
    } catch (requestError) {
      if (requestError is RequestErrorException) {
        return left(RequestFailure(message: requestError.responseMessage));
      }
      return Left(
        RequestFailure(message: requestError.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, GetProductsEntity>>? getAllProducts(
      NoParams params) async {
    try {
      final products = await remoteDataSources.getAllProducts();
      return Right(products);
    } on UnknownServerException {
      return const Left(ServerFailure());
    } catch (requestError) {
      if (requestError is RequestErrorException) {
        return left(RequestFailure(message: requestError.responseMessage));
      }
      return Left(
        RequestFailure(message: requestError.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, GetProductsEntity>>? getProductsByCategoryName(
      String category) async {
    try {
      final products = await remoteDataSources.getProductsByCategory(category);
      return Right(products);
    } on UnknownServerException {
      return const Left(ServerFailure());
    } catch (requestError) {
      if (requestError is RequestErrorException) {
        return left(RequestFailure(message: requestError.responseMessage));
      }
      return Left(
        RequestFailure(message: requestError.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, bool>>? userLogout(NoParams params) async {
    try {
      await localDataSources.saveUserLogoutStatus();
      await localDataSources.clearUserData();

      return const Right(true);
    } on UnknownServerException {
      return const Left(ServerFailure());
    } catch (requestError) {
      if (requestError is RequestErrorException) {
        return left(RequestFailure(message: requestError.responseMessage));
      }
      return Left(
        RequestFailure(message: requestError.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, bool>>? addToCart(List<CartEntity> cart) async {
    try {
      await localDataSources.saveCartData(cart);

      return const Right(true);
    } on UnknownServerException {
      return const Left(ServerFailure());
    } catch (requestError) {
      if (requestError is RequestErrorException) {
        return left(RequestFailure(message: requestError.responseMessage));
      }
      return Left(
        RequestFailure(message: requestError.toString()),
      );
    }
  }
}
