import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'history_location_event.dart';
part 'history_location_state.dart';

class HistoryLocationBloc
    extends Bloc<HistoryLocationEvent, HistoryLocationState> {
  HistoryLocationBloc() : super(const HistoryLocationState()) {
    on<NewLocationEvent>(_newLocationEventocation);
  }

  void onNewUserLocation((double lat, double lng) location) {
    add(NewLocationEvent(location));
  }

  void _newLocationEventocation(
      NewLocationEvent event, Emitter<HistoryLocationState> emit) {
    emit(state.copyWith(location: [...state.location, event.location]));
  }
}
