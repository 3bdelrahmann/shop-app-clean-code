import 'package:dartz/dartz.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/features/login/domain/entities/user_entity.dart';
import 'package:inthekloud_shop_app/features/login/domain/usecases/user_login_usecase.dart';

abstract class UserLoginRepository {
  Future<Either<Failure, UserEntity>>? userLogin(UserLoginParams params);
}
