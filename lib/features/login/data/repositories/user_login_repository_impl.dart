import 'package:dartz/dartz.dart';
import 'package:inthekloud_shop_app/core/error/exception.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/features/login/data/datasources/user_login_local_data_source.dart';
import 'package:inthekloud_shop_app/features/login/data/datasources/user_login_remote_data_source.dart';
import 'package:inthekloud_shop_app/features/login/domain/entities/user_entity.dart';
import 'package:inthekloud_shop_app/features/login/domain/repositories/user_login_repository.dart';
import 'package:inthekloud_shop_app/features/login/domain/usecases/user_login_usecase.dart';

class UserLoginRepositoryImp implements UserLoginRepository {
  UserLoginRepositoryImp({
    required this.localDataSources,
    required this.remoteDataSources,
  });

  final UserLoginRemoteDataSources remoteDataSources;
  final UserLoginLocalDataSources localDataSources;
  @override
  Future<Either<Failure, UserEntity>>? userLogin(UserLoginParams params) async {
    try {
      final user = await remoteDataSources.userLogin(params);
      await localDataSources.saveUserData(user);
      await localDataSources.saveUserLoginStatus();
      return Right(user);
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
