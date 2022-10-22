import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/core/use_cases/usecase.dart';
import 'package:inthekloud_shop_app/features/login/domain/entities/user_entity.dart';
import 'package:inthekloud_shop_app/features/login/domain/repositories/user_login_repository.dart';

class UserLoginUseCase implements UseCase<UserEntity, UserLoginParams> {
  final UserLoginRepository userLoginRepository;

  UserLoginUseCase(this.userLoginRepository);
  @override
  Future<Either<Failure, UserEntity>?> call(UserLoginParams params) async {
    if (params.userName.isEmpty || params.userPassword.isEmpty) {
      return left(
        const InputFieldFailure(message: 'Enter all required fields'),
      );
    } else {
      return await userLoginRepository.userLogin(params);
    }
  }
}

class UserLoginParams extends Equatable {
  final String userName;
  final String userPassword;

  const UserLoginParams({required this.userName, required this.userPassword});

  @override
  List<Object> get props => [userName, userPassword];
}
