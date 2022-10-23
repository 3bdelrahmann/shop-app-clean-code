import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/core/use_cases/usecase.dart';
import 'package:inthekloud_shop_app/features/home/data/models/cart_model.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/products_entity.dart';
import 'package:inthekloud_shop_app/features/home/domain/usecases/add_to_cart_usecase.dart';
import 'package:inthekloud_shop_app/features/home/domain/usecases/get_all_products_usecase.dart';
import 'package:inthekloud_shop_app/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:inthekloud_shop_app/features/home/domain/usecases/get_product_by_name_usecase.dart';
import 'package:inthekloud_shop_app/features/home/domain/usecases/user_logout_usecase.dart';
import 'package:inthekloud_shop_app/features/login/presentation/pages/login_page.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllProductsUseCase getAllProductsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetProductsByCategoryNameUseCase getProductsByCategoryNameUseCase;
  final UserLogoutUseCase userLogoutUseCase;
  final AddToCartUseCase addToCartUseCase;

  List<dynamic> categoriesList = [];
  List<ProductsEntity> productsList = [];

  HomeBloc(
      this.getAllProductsUseCase,
      this.getCategoriesUseCase,
      this.getProductsByCategoryNameUseCase,
      this.userLogoutUseCase,
      this.addToCartUseCase)
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
        emit(GetProductsByCategoryNameLoading());

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
      } else if (event is UserLogout) {
        emit(UserLogoutLoading());
        final userLogoutRes = await userLogoutUseCase(NoParams());

        userLogoutRes?.fold((failure) {
          emit(
            UserLogoutFailed(failureObject: failure),
          );
        }, (status) {
          Navigator.pushAndRemoveUntil(
              event.context,
              MaterialPageRoute(
                builder: (BuildContext context) => LoginScreen(),
                settings: const RouteSettings(name: 'LoginScreen'),
              ),
              ModalRoute.withName('/'));
          emit(UserLogoutSuccess());
        });
      } else if (event is AddToCart) {
        emit(AddToCartLoading());

        final addToCartRes = await addToCartUseCase(event.cart);

        addToCartRes?.fold((failure) {
          emit(
            AddToCartFailed(failureObject: failure),
          );
        }, (status) {
          emit(AddToCartSuccess());
        });
      }
    });
  }
}
