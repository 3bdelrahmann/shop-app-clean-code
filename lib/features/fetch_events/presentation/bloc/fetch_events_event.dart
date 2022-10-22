part of 'fetch_events_bloc.dart';

abstract class FetchEventsEvent extends Equatable {
  const FetchEventsEvent();

  @override
  List<Object> get props => [];
}

class GetDataFromLocal extends FetchEventsEvent {}
