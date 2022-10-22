part of 'login_bloc.dart';

abstract class UserLoginEvent extends Equatable {
  const UserLoginEvent();

  @override
  List<Object> get props => [];
}

class UserLogin extends UserLoginEvent {
  final UserLoginParams params;

  const UserLogin({required this.params});
  @override
  List<Object> get props => [params];
}
