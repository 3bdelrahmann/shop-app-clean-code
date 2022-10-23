import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/products_entity.dart';
import 'package:inthekloud_shop_app/features/product_details/domain/usecases/get_product_by_id_usecase.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final GetProductsByIDUseCase getProductsByIDUseCase;

  ProductsEntity productIem = ProductsEntity();

  ProductDetailsBloc(this.getProductsByIDUseCase)
      : super(ProductDetailsInitial()) {
    on<ProductDetailsEvent>((event, emit) async {
      if (event is GetProductsByID) {
        emit(GetProductsByIDLoading());

        final getProductsByIDRes =
            await getProductsByIDUseCase(event.productID);

        getProductsByIDRes?.fold((failure) {
          emit(
            GetProductsByIDFailed(
              failureObject: failure,
            ),
          );
        }, (product) {
          productIem = product;
          emit(GetProductsByIDSuccess(product: product));
        });
      }
    });
  }
}
