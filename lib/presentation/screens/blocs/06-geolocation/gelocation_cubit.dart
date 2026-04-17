import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
part 'gelocation_state.dart';

class GelocationCubit extends Cubit<GelocationState> {
  final void Function((double lat, double lng))? onNewUserLocationCallback;

  GelocationCubit({this.onNewUserLocationCallback})
      : super(const GelocationState());

  Future<void> checkStatus() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    LocationPermission permissionGranted = await Geolocator.checkPermission();

    if (permissionGranted == LocationPermission.denied) {
      permissionGranted = await Geolocator.requestPermission();
    }

    emit(state.copyWith(
        permissionGranted: permissionGranted == LocationPermission.always ||
            permissionGranted == LocationPermission.whileInUse,
        serviceEnabled: serviceEnabled));
  }

  Future<void> watchUserLocation() async {
    await checkStatus();

    if (!state.permissionGranted || !state.serviceEnabled) return;

    const locationSettings = LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation, distanceFilter: 15);

    Geolocator.getPositionStream(locationSettings: locationSettings).listen(
      (position) {
        final newLocation = (position.latitude, position.longitude);

        emit(state.copyWith(location: newLocation));

// si existe la funcion lo llama, si no entonces no hace nada
        onNewUserLocationCallback?.call(newLocation);
      },
    );
  }
}
