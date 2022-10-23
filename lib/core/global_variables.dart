import 'package:inthekloud_shop_app/features/home/data/models/cart_model.dart';
import 'package:inthekloud_shop_app/features/login/domain/entities/user_entity.dart';

class Global {
  static bool isLoggedIn = false;
  static UserEntity userObj = UserEntity();
  static List<CartModel> cartList = [];

  // SharedPref keys
  static String userKey = 'user';
  static String userLoginStatusKey = 'isLoggedIn';
  static String userCartKey = 'cart';
}
