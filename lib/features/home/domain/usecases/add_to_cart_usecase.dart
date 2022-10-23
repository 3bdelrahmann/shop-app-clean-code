import 'package:dartz/dartz.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/core/use_cases/usecase.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/cart_entity.dart';
import 'package:inthekloud_shop_app/features/home/domain/repositories/home_repository.dart';

class AddToCartUseCase implements UseCase<bool, List<CartEntity>> {
  final HomeRepository homeRepository;

  AddToCartUseCase(this.homeRepository);

  @override
  Future<Either<Failure, bool>?> call(List<CartEntity> params) async {
    return await homeRepository.addToCart(params);
  }
}
