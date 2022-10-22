import 'package:inthekloud_shop_app/core/data_sources/remote_data_source.dart';
import 'package:inthekloud_shop_app/features/login/data/models/user_model.dart';
import 'package:inthekloud_shop_app/features/login/domain/usecases/user_login_usecase.dart';

abstract class UserLoginRemoteDataSources {
  Future<UserModel> userLogin(UserLoginParams params);
}

class UserLoginRemoteDataSourcesImp implements UserLoginRemoteDataSources {
  final RemoteDataSource remoteDataSource;

  UserLoginRemoteDataSourcesImp(this.remoteDataSource);
  @override
  Future<UserModel> userLogin(UserLoginParams params) async {
    String endPoint = 'auth/login';

    Map body = {
      "username": params.userName,
      "password": params.userPassword,
    };
    final response =
        await remoteDataSource.post(endPoint: endPoint, body: body);

    return UserModel.fromJson(response);
  }
}
