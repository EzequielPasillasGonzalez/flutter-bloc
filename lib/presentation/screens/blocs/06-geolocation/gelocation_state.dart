part of 'gelocation_cubit.dart';

class GelocationState extends Equatable {
  final (double lat, double lng) location;
  final bool serviceEnabled;
  final bool permissionGranted;

  const GelocationState(
      {this.location = const (0, 0),
      this.serviceEnabled = false,
      this.permissionGranted = false});

  @override
  List<Object?> get props => [location, serviceEnabled, permissionGranted];

  GelocationState copyWith((double lat, double lng)? location,
          bool? serviceEnabled, bool? permissionGranted) =>
      GelocationState(
          location: location ?? this.location,
          permissionGranted: permissionGranted ?? this.permissionGranted,
          serviceEnabled: serviceEnabled ?? this.permissionGranted);
}
