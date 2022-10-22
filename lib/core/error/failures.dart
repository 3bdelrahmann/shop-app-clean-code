import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String? message;

  const Failure({this.message = "Unexpected Error , Please try again later"});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({String? message})
      : super(message: message ?? "serverFailure");
}

class RequestFailure extends Failure {
  const RequestFailure({required String message}) : super(message: message);
}

class InputFieldFailure extends Failure {
  const InputFieldFailure({required String message}) : super(message: message);
}
