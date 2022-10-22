import 'dart:convert';

import 'package:inthekloud_shop_app/core/data_sources/local_data_source.dart';
import 'package:inthekloud_shop_app/core/global_variables.dart';
import 'package:inthekloud_shop_app/features/home/data/models/cart_model.dart';

abstract class HomeLocalDataSources {
  Future<void> saveCartData(CartModel cart);
  Future<CartModel> getCartData();
  Future<void> saveUserLogoutStatus();
}

class HomeLocalDataSourcesImp implements HomeLocalDataSources {
  HomeLocalDataSourcesImp();
  @override
  Future<void> saveCartData(cart) async {
    Global.cartObj = cart;

    await LocalDataSource.setData(
      key: Global.userKey,
      value: jsonEncode(cart.toJson()),
    );
  }

  @override
  Future<CartModel> getCartData() async {
    final cartData = await LocalDataSource.getData(key: Global.userCartKey);
    if (cartData != null) {
      return Future.value(CartModel.fromJson(jsonDecode(cartData)));
    } else {
      return Future.value(CartModel());
    }
  }

  @override
  Future<void> saveUserLogoutStatus() async {
    await LocalDataSource.setData(
      key: Global.userLoginStatusKey,
      value: false,
    );
  }
}
