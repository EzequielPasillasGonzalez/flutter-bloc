part of 'history_location_bloc.dart';

class HistoryLocationState extends Equatable {
  final List<(double lat, double lng)> location;

  const HistoryLocationState({this.location = const []});

  int get howManyLocation => location.length;

  @override
  List<Object?> get props => [location];

  HistoryLocationState copyWith({List<(double lat, double lng)>? location}) =>
      HistoryLocationState(location: location ?? this.location);
}
