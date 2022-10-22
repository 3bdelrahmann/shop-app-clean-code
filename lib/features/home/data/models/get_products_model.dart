import 'package:inthekloud_shop_app/features/home/data/models/products_model.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/get_products_entity.dart';

class GetProductsModel extends GetProductsEntity {
  GetProductsModel({
    List<ProductsModel>? products,
    int? total,
    int? skip,
    int? limit,
  }) : super(
          products: products,
          total: total,
          skip: skip,
          limit: limit,
        );

  GetProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductsModel>[];
      json['products'].forEach((v) {
        products!.add(ProductsModel.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}
