import 'dart:convert';

import 'package:inthekloud_shop_app/core/data_sources/local_data_source.dart';
import 'package:inthekloud_shop_app/core/global_variables.dart';
import 'package:inthekloud_shop_app/features/login/data/models/user_model.dart';

abstract class UserLoginLocalDataSources {
  Future<void> saveUserData(UserModel user);
  Future<UserModel> getUserData();
  Future<void> saveUserLoginStatus();
  Future<bool> getUserLoginStatus();
}

class UserLoginLocalDataSourcesImp implements UserLoginLocalDataSources {
  UserLoginLocalDataSourcesImp();
  @override
  Future<void> saveUserData(user) async {
    Global.userObj = user;

    await LocalDataSource.setData(
      key: Global.userKey,
      value: jsonEncode(user.toJson()),
    );
  }

  @override
  Future<UserModel> getUserData() async {
    final userData = await LocalDataSource.getData(key: Global.userKey);
    if (userData != null) {
      return Future.value(UserModel.fromJson(jsonDecode(userData)));
    } else {
      return Future.value(UserModel());
    }
  }

  @override
  Future<void> saveUserLoginStatus() async {
    await LocalDataSource.setData(
      key: Global.userLoginStatusKey,
      value: true,
    );
  }

  @override
  Future<bool> getUserLoginStatus() async {
    final statusData =
        await LocalDataSource.getData(key: Global.userLoginStatusKey);
    if (statusData != null) {
      return statusData;
    } else {
      return false;
    }
  }
}
