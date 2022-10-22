import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/features/login/domain/entities/user_entity.dart';
import 'package:inthekloud_shop_app/features/login/domain/usecases/user_login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  final UserLoginUseCase userLoginUseCase;
  UserLoginBloc(this.userLoginUseCase) : super(LoginInitial()) {
    on<UserLoginEvent>((event, emit) async {
      if (event is UserLogin) {
        emit(UserLoginLoading());

        final salesmanLoginRes = await userLoginUseCase(event.params);

        salesmanLoginRes?.fold((failure) {
          emit(
            UserLoginFailed(
              failureObject: failure,
            ),
          );
        }, (user) {
          emit(UserLoginSuccess(user: user));
        });
      }
    });
  }
}
