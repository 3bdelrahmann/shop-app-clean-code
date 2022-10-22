import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/core/use_cases/usecase.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/products_entity.dart';
import 'package:inthekloud_shop_app/features/home/domain/usecases/get_all_products_usecase.dart';
import 'package:inthekloud_shop_app/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:inthekloud_shop_app/features/home/domain/usecases/get_product_by_name_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllProductsUseCase getAllProductsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetProductsByCategoryNameUseCase getProductsByCategoryNameUseCase;

  List<String> categoriesList = [];
  List<ProductsEntity> productsList = [];
  HomeBloc(this.getAllProductsUseCase, this.getCategoriesUseCase,
      this.getProductsByCategoryNameUseCase)
      : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetCategories) {
        emit(HomeLoading());

        final getCategoriesRes = await getCategoriesUseCase(NoParams());

        getCategoriesRes?.fold((failure) {
          emit(
            GetCategoriesFailed(
              failureObject: failure,
            ),
          );
        }, (categories) {
          categoriesList = categories;
          emit(const GetCategoriesSuccess());
        });
      } else if (event is GetAllProducts) {
        emit(HomeLoading());

        final getALLProductsRes = await getAllProductsUseCase(NoParams());

        getALLProductsRes?.fold((failure) {
          emit(
            GetAllProductsFailed(
              failureObject: failure,
            ),
          );
        }, (products) {
          productsList = products.products ?? [];
          emit(GetAllProductsSuccess(products: productsList));
        });
      } else if (event is GetProductsByCategoryName) {
        emit(HomeLoading());

        final getProductsByCategoryRes =
            await getProductsByCategoryNameUseCase(event.category);

        getProductsByCategoryRes?.fold((failure) {
          emit(
            GetProductsByCategoryNameFailed(
              failureObject: failure,
            ),
          );
        }, (products) {
          productsList = products.products ?? [];
          emit(GetProductsByCategoryNameSuccess(products: productsList));
        });
      }
    });
  }
}
