import 'package:dartz/dartz.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/core/use_cases/usecase.dart';
import 'package:inthekloud_shop_app/features/fetch_events/domain/repositories/fetch_events_repository.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/cart_entity.dart';

class GetLocalCartDataUseCase implements UseCase<CartEntity, NoParams> {
  final FetchEventsRepository repository;

  GetLocalCartDataUseCase(this.repository);

  @override
  Future<Either<Failure, CartEntity>?> call(NoParams params) async {
    return await repository.cartDataFromLocal();
  }
}
