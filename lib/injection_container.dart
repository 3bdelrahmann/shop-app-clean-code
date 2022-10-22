import 'package:get_it/get_it.dart';
import 'package:inthekloud_shop_app/core/data_sources/remote_data_source.dart';
import 'package:inthekloud_shop_app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:inthekloud_shop_app/features/fetch_events/data/repositories/fetch_events_repository_impl.dart';
import 'package:inthekloud_shop_app/features/fetch_events/domain/repositories/fetch_events_repository.dart';
import 'package:inthekloud_shop_app/features/fetch_events/domain/usecases/get_local_cart_data_usecase.dart';
import 'package:inthekloud_shop_app/features/fetch_events/domain/usecases/get_local_user_data_usecase.dart';
import 'package:inthekloud_shop_app/features/fetch_events/domain/usecases/get_local_user_login_status_usecase.dart';
import 'package:inthekloud_shop_app/features/fetch_events/presentation/bloc/fetch_events_bloc.dart';
import 'package:inthekloud_shop_app/features/home/data/datasources/home_local_data_source.dart';
import 'package:inthekloud_shop_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:inthekloud_shop_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:inthekloud_shop_app/features/home/domain/repositories/home_repository.dart';
import 'package:inthekloud_shop_app/features/home/domain/usecases/get_all_products_usecase.dart';
import 'package:inthekloud_shop_app/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:inthekloud_shop_app/features/home/domain/usecases/get_product_by_name_usecase.dart';
import 'package:inthekloud_shop_app/features/home/domain/usecases/user_logout_usecase.dart';
import 'package:inthekloud_shop_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:inthekloud_shop_app/features/login/data/datasources/user_login_local_data_source.dart';
import 'package:inthekloud_shop_app/features/login/data/datasources/user_login_remote_data_source.dart';
import 'package:inthekloud_shop_app/features/login/data/repositories/user_login_repository_impl.dart';
import 'package:inthekloud_shop_app/features/login/domain/repositories/user_login_repository.dart';
import 'package:inthekloud_shop_app/features/login/domain/usecases/user_login_usecase.dart';
import 'package:inthekloud_shop_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:inthekloud_shop_app/features/main_layout/presentation/bloc/main_layout_bloc.dart';
import 'package:inthekloud_shop_app/features/product_details/presentation/bloc/product_details_bloc.dart';
import 'package:inthekloud_shop_app/features/profile/presentation/bloc/profile_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Features

// Bloc

  sl.registerFactory(() => MainLayoutBloc());

  sl.registerFactory(() => UserLoginBloc(sl()));

  sl.registerFactory(() => FetchEventsBloc(sl(), sl(), sl()));

  sl.registerFactory(() => HomeBloc(sl(), sl(), sl(), sl()));

  sl.registerFactory(() => CartBloc());

  sl.registerFactory(() => ProductDetailsBloc());

  sl.registerFactory(() => ProfileBloc());

// UseCases

  sl.registerLazySingleton(() => UserLoginUseCase(sl()));

  sl.registerLazySingleton(() => GetLocalUserDataUseCase(sl()));

  sl.registerLazySingleton(() => GetLocalCartDataUseCase(sl()));

  sl.registerLazySingleton(() => GetLocalUserLoginStatusUseCase(sl()));

  sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));

  sl.registerLazySingleton(() => GetAllProductsUseCase(sl()));

  sl.registerLazySingleton(() => GetProductsByCategoryNameUseCase(sl()));

  sl.registerLazySingleton(() => UserLogoutUseCase(sl()));

// Repository

  sl.registerLazySingleton<UserLoginRepository>(() =>
      UserLoginRepositoryImp(localDataSources: sl(), remoteDataSources: sl()));

  sl.registerLazySingleton<FetchEventsRepository>(() =>
      FetchEventsRepositoryImp(
          userLoginLocalDataSource: sl(), homeLocalDataSources: sl()));

  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImp(remoteDataSources: sl(), localDataSources: sl()));

// DataSources

  sl.registerLazySingleton<UserLoginRemoteDataSources>(
      () => UserLoginRemoteDataSourcesImp(sl()));

  sl.registerLazySingleton<UserLoginLocalDataSources>(
      () => UserLoginLocalDataSourcesImp());

  sl.registerLazySingleton<HomeRemoteDataSources>(
      () => HomeRemoteDataSourcesImp(sl()));

  sl.registerLazySingleton<HomeLocalDataSources>(
      () => HomeLocalDataSourcesImp());

  /// Core

  sl.registerLazySingleton(() => RemoteDataSource());
}
