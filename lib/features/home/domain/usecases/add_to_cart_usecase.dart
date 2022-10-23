import 'package:dartz/dartz.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/core/use_cases/usecase.dart';
import 'package:inthekloud_shop_app/features/home/data/models/cart_model.dart';
import 'package:inthekloud_shop_app/features/home/domain/repositories/home_repository.dart';

class AddToCartUseCase implements UseCase<bool, List<CartModel>> {
  final HomeRepository homeRepository;

  AddToCartUseCase(this.homeRepository);

  @override
  Future<Either<Failure, bool>?> call(List<CartModel> params) async {
    return await homeRepository.addToCart(params);
  }
}
