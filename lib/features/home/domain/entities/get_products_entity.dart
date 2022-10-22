import 'package:equatable/equatable.dart';
import 'package:inthekloud_shop_app/features/home/data/models/products_model.dart';

class GetProductsEntity extends Equatable {
  List<ProductsModel>? products;
  int? total;
  int? skip;
  int? limit;

  GetProductsEntity({this.products, this.total, this.skip, this.limit});

  @override
  List<Object?> get props => [products, total, skip, limit];
}
