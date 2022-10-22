import 'package:inthekloud_shop_app/features/home/domain/entities/cart_entity.dart';
import 'package:inthekloud_shop_app/features/login/domain/entities/user_entity.dart';

class Global {
  static bool isLoggedIn = false;
  static UserEntity userObj = UserEntity();
  static CartEntity cartObj = CartEntity();

  // SharedPref keys
  static String userKey = 'user';
  static String userLoginStatusKey = 'isLoggedIn';
  static String userCartKey = 'cart';
}
