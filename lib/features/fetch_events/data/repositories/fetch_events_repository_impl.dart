import 'package:dartz/dartz.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/features/fetch_events/domain/repositories/fetch_events_repository.dart';
import 'package:inthekloud_shop_app/features/home/data/datasources/home_local_data_source.dart';
import 'package:inthekloud_shop_app/features/home/data/models/cart_model.dart';
import 'package:inthekloud_shop_app/features/login/data/datasources/user_login_local_data_source.dart';
import 'package:inthekloud_shop_app/features/login/data/models/user_model.dart';

class FetchEventsRepositoryImp implements FetchEventsRepository {
  FetchEventsRepositoryImp(
      {required this.homeLocalDataSources,
      required this.userLoginLocalDataSource});

  final UserLoginLocalDataSources userLoginLocalDataSource;
  final HomeLocalDataSources homeLocalDataSources;

  @override
  Future<Either<Failure, UserModel>>? userDataFromLocal() async {
    try {
      final userData = await userLoginLocalDataSource.getUserData();
      return Right(userData);
    } catch (exception) {
      return Left(RequestFailure(message: exception.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>>? userLoginStatusDataFromLocal() async {
    try {
      final salesmanLoginStatus =
          await userLoginLocalDataSource.getUserLoginStatus();
      return Right(salesmanLoginStatus);
    } catch (exception) {
      return Left(RequestFailure(message: exception.toString()));
    }
  }

  @override
  Future<Either<Failure, CartModel>>? cartDataFromLocal() async {
    try {
      final cartData = await homeLocalDataSources.getCartData();
      return Right(cartData);
    } catch (exception) {
      return Left(RequestFailure(message: exception.toString()));
    }
  }
}
