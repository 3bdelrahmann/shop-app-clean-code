import 'package:dartz/dartz.dart';
import 'package:inthekloud_shop_app/core/error/exception.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/products_entity.dart';
import 'package:inthekloud_shop_app/features/product_details/data/datasources/product_details_remote_data_source.dart';
import 'package:inthekloud_shop_app/features/product_details/domain/repositories/product_details_repository.dart';

class ProductDetailsRepositoryImp implements ProductDetailsRepository {
  ProductDetailsRepositoryImp({
    required this.remoteDataSources,
  });

  final ProductDetailsRemoteDataSources remoteDataSources;

  @override
  Future<Either<Failure, ProductsEntity>>? getProductsByID(
      String productID) async {
    try {
      final product = await remoteDataSources.getProductsByID(productID);
      return Right(product);
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
