import 'package:dartz/dartz.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/core/use_cases/usecase.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/get_products_entity.dart';
import 'package:inthekloud_shop_app/features/home/domain/repositories/home_repository.dart';

class GetAllProductsUseCase implements UseCase<GetProductsEntity, NoParams> {
  final HomeRepository homeRepository;

  GetAllProductsUseCase(this.homeRepository);

  @override
  Future<Either<Failure, GetProductsEntity>?> call(NoParams params) async {
    return await homeRepository.getAllProducts(params);
  }
}
