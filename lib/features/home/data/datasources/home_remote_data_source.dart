import 'package:inthekloud_shop_app/core/data_sources/remote_data_source.dart';
import 'package:inthekloud_shop_app/features/home/data/models/get_products_model.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/get_products_entity.dart';

abstract class HomeRemoteDataSources {
  Future<List<String>> getCategories();
  Future<GetProductsEntity> getAllProducts();
  Future<GetProductsEntity> getProductsByCategory(String category);
}

class HomeRemoteDataSourcesImp implements HomeRemoteDataSources {
  final RemoteDataSource remoteDataSource;

  HomeRemoteDataSourcesImp(this.remoteDataSource);
  @override
  Future<List<String>> getCategories() async {
    String endPoint = 'products/categories';

    final response = await remoteDataSource.get(endPoint: endPoint);

    return response;
  }

  @override
  Future<GetProductsEntity> getAllProducts() async {
    String endPoint = 'products';

    final response = await remoteDataSource.get(endPoint: endPoint);

    return GetProductsModel.fromJson(response);
  }

  @override
  Future<GetProductsEntity> getProductsByCategory(String category) async {
    String endPoint = 'products/category/$category';

    final response = await remoteDataSource.get(endPoint: endPoint);

    return GetProductsModel.fromJson(response);
  }
}
