// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'history_location_bloc.dart';

sealed class HistoryLocationEvent extends Equatable {
  const HistoryLocationEvent();

  @override
  List<Object> get props => [];
}

class NewLocationEvent extends HistoryLocationEvent {
  final (double lat, double lng) location;
  const NewLocationEvent(
    this.location,
  );

  @override
  List<Object> get props => [location];
}
