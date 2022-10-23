import 'package:dartz/dartz.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/core/use_cases/usecase.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/products_entity.dart';
import 'package:inthekloud_shop_app/features/product_details/domain/repositories/product_details_repository.dart';

class GetProductsByIDUseCase implements UseCase<ProductsEntity, String> {
  final ProductDetailsRepository productDetailsRepository;

  GetProductsByIDUseCase(this.productDetailsRepository);

  @override
  Future<Either<Failure, ProductsEntity>?> call(String productID) async {
    return await productDetailsRepository.getProductsByID(productID);
  }
}
