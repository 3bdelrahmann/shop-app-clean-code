import 'package:dartz/dartz.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/core/use_cases/usecase.dart';
import 'package:inthekloud_shop_app/features/fetch_events/domain/repositories/fetch_events_repository.dart';
import 'package:inthekloud_shop_app/features/login/domain/entities/user_entity.dart';

class GetLocalUserDataUseCase implements UseCase<UserEntity, NoParams> {
  final FetchEventsRepository repository;

  GetLocalUserDataUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>?> call(NoParams params) async {
    return await repository.userDataFromLocal();
  }
}
