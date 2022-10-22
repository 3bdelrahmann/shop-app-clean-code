part of 'login_bloc.dart';

abstract class UserLoginState extends Equatable {
  const UserLoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends UserLoginState {}

class UserLoginLoading extends UserLoginState {}

class UserLoginSuccess extends UserLoginState {
  const UserLoginSuccess({required this.user});

  final UserEntity user;

  @override
  List<Object> get props => [user];
}

class UserLoginFailed extends UserLoginState {
  const UserLoginFailed({required this.failureObject});
  final Failure failureObject;

  @override
  List<Object> get props => [failureObject];
}
