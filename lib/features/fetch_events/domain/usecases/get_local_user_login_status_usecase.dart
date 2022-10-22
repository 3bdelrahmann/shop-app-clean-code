import 'package:dartz/dartz.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/core/use_cases/usecase.dart';
import 'package:inthekloud_shop_app/features/fetch_events/domain/repositories/fetch_events_repository.dart';

class GetLocalUserLoginStatusUseCase implements UseCase<bool, NoParams> {
  final FetchEventsRepository repository;

  GetLocalUserLoginStatusUseCase(this.repository);

  @override
  Future<Either<Failure, bool>?> call(NoParams params) async {
    return await repository.userLoginStatusDataFromLocal();
  }
}
