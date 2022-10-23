import 'dart:convert';

import 'package:inthekloud_shop_app/core/data_sources/local_data_source.dart';
import 'package:inthekloud_shop_app/core/global_variables.dart';
import 'package:inthekloud_shop_app/features/home/data/models/cart_model.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/cart_entity.dart';
import 'package:inthekloud_shop_app/features/login/data/models/user_model.dart';
import 'package:inthekloud_shop_app/features/login/domain/entities/user_entity.dart';

abstract class HomeLocalDataSources {
  Future<void> saveCartData(List<CartEntity> cart);
  Future<List<CartModel>> getCartData();
  Future<void> saveUserLogoutStatus();
  Future<void> clearUserData();
}

class HomeLocalDataSourcesImp implements HomeLocalDataSources {
  HomeLocalDataSourcesImp();
  @override
  Future<void> saveCartData(carts) async {
    Global.cartList = carts;
    // Encode and store data in SharedPreferences
    final String encodedData = json.encode(
      carts
          .map<Map<String, dynamic>>((cart) => CartModel.toJson(cart))
          .toList(),
    );

    await LocalDataSource.setData(
      key: Global.userKey,
      value: encodedData,
    );
  }

  @override
  Future<List<CartModel>> getCartData() async {
    // Fetch and decode data
    final cartData = await LocalDataSource.getData(key: Global.userCartKey);

    final cartList = (json.decode(cartData) as List<dynamic>)
        .map<CartModel>((item) => CartModel.fromJson(item))
        .toList();

    if (cartData != null) {
      return cartList;
    } else {
      return Future.value([]);
    }
  }

  @override
  Future<void> saveUserLogoutStatus() async {
    await LocalDataSource.setData(
      key: Global.userLoginStatusKey,
      value: false,
    );
  }

  @override
  Future<void> clearUserData() async {
    Global.userObj = UserEntity();
    Global.cartList = [];

    await LocalDataSource.setData(
      key: Global.userKey,
      value: jsonEncode(UserModel().toJson()),
    );
  }
}
