import 'package:dartz/dartz.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/core/use_cases/usecase.dart';
import 'package:inthekloud_shop_app/features/home/domain/repositories/home_repository.dart';

class UserLogoutUseCase implements UseCase<bool, NoParams> {
  final HomeRepository homeRepository;

  UserLogoutUseCase(this.homeRepository);

  @override
  Future<Either<Failure, bool>?> call(NoParams params) async {
    return await homeRepository.userLogout(params);
  }
}
