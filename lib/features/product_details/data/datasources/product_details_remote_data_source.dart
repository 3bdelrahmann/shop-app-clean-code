import 'package:inthekloud_shop_app/core/data_sources/remote_data_source.dart';
import 'package:inthekloud_shop_app/features/home/data/models/products_model.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/products_entity.dart';

abstract class ProductDetailsRemoteDataSources {
  Future<ProductsEntity> getProductsByID(String productID);
}

class ProductDetailsRemoteDataSourcesImp
    implements ProductDetailsRemoteDataSources {
  final RemoteDataSource remoteDataSource;

  ProductDetailsRemoteDataSourcesImp(this.remoteDataSource);
  @override
  Future<ProductsEntity> getProductsByID(String productID) async {
    String endPoint = 'products/$productID';

    final response = await remoteDataSource.get(endPoint: endPoint);

    return ProductsModel.fromJson(response);
  }
}
