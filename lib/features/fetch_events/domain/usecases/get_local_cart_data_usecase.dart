import 'package:dartz/dartz.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/core/use_cases/usecase.dart';
import 'package:inthekloud_shop_app/features/fetch_events/domain/repositories/fetch_events_repository.dart';
import 'package:inthekloud_shop_app/features/home/data/models/cart_model.dart';

class GetLocalCartDataUseCase implements UseCase<List<CartModel>, NoParams> {
  final FetchEventsRepository repository;

  GetLocalCartDataUseCase(this.repository);

  @override
  Future<Either<Failure, List<CartModel>>?> call(NoParams params) async {
    return await repository.cartDataFromLocal();
  }
}
