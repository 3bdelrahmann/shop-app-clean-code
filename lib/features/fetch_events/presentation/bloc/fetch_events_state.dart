part of 'fetch_events_bloc.dart';

abstract class FetchEventsState extends Equatable {
  const FetchEventsState();

  @override
  List<Object> get props => [];
}

class FetchEventsInitial extends FetchEventsState {}

class FetchEventsLoading extends FetchEventsState {}

class FetchEventsSuccess extends FetchEventsState {}

class FetchEventsFailed extends FetchEventsState {
  const FetchEventsFailed({required this.failureObject});
  final Failure failureObject;

  @override
  List<Object> get props => [failureObject];
}
