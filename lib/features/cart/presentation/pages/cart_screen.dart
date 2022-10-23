import 'package:flutter/material.dart';
import 'package:inthekloud_shop_app/core/global_variables.dart';
import 'package:inthekloud_shop_app/features/cart/presentation/widgets/product_item.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/products_entity.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: 8.0,
              end: 8.0,
              bottom: MediaQuery.of(context).size.height * 0.12),
          child: Column(
            children: List.generate(
                Global.cartList.length,
                (index) => ProductItem(
                      product: ProductsEntity(),
                    )),
          ),
        ),
      ),
    );
  }
}
