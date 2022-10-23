import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/core/global_variables.dart';
import 'package:inthekloud_shop_app/core/use_cases/usecase.dart';
import 'package:inthekloud_shop_app/features/fetch_events/domain/usecases/get_local_cart_data_usecase.dart';
import 'package:inthekloud_shop_app/features/fetch_events/domain/usecases/get_local_user_data_usecase.dart';
import 'package:inthekloud_shop_app/features/fetch_events/domain/usecases/get_local_user_login_status_usecase.dart';

part 'fetch_events_event.dart';
part 'fetch_events_state.dart';

class FetchEventsBloc extends Bloc<FetchEventsEvent, FetchEventsState> {
  final GetLocalUserDataUseCase getLocalSalesmanDataUseCase;
  final GetLocalUserLoginStatusUseCase getLocalSalesmanLoginStatusUseCase;
  final GetLocalCartDataUseCase getLocalCartDataUseCase;
  FetchEventsBloc(this.getLocalSalesmanDataUseCase,
      this.getLocalSalesmanLoginStatusUseCase, this.getLocalCartDataUseCase)
      : super(FetchEventsInitial()) {
    on<FetchEventsEvent>((event, emit) async {
      if (event is GetDataFromLocal) {
        emit(FetchEventsLoading());

        final salesmanData = await getLocalSalesmanDataUseCase(NoParams());
        final cartData = await getLocalCartDataUseCase(NoParams());
        final salesmanLoginStatus =
            await getLocalSalesmanLoginStatusUseCase(NoParams());

        salesmanData
            ?.fold((failure) => emit(FetchEventsFailed(failureObject: failure)),
                (salesman) {
          salesmanLoginStatus?.fold(
              (failure) => emit(FetchEventsFailed(failureObject: failure)),
              (status) {
            Global.userObj = salesman;
            Global.isLoggedIn = status;
            emit(FetchEventsSuccess());
            cartData?.fold(
                (failure) => emit(FetchEventsFailed(failureObject: failure)),
                (cart) {
              Global.cartList = cart;
              emit(FetchEventsSuccess());
            });
          });
        });
      }
    });
  }
}
