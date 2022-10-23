import 'package:dartz/dartz.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/features/home/data/models/cart_model.dart';
import 'package:inthekloud_shop_app/features/login/data/models/user_model.dart';

abstract class FetchEventsRepository {
  Future<Either<Failure, UserModel>>? userDataFromLocal();
  Future<Either<Failure, bool>>? userLoginStatusDataFromLocal();
  Future<Either<Failure, List<CartModel>>>? cartDataFromLocal();
}
