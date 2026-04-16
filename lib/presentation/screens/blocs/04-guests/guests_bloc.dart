import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'guests_event.dart';
part 'guests_state.dart';

const uuid = Uuid();

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc()
      : super(GuestsState(guests: [
          Todo(
              id: uuid.v8(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v8(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v8(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: uuid.v8(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: uuid.v8(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v8(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
        ])) {
    on<SetInvitedFilterEvent>(_setInvitedFilterEvent);
    on<SetAllFilterEvent>(_setAllFilterEvent);
    on<SetNoInvitedFilterEvent>(_setNoInvitedFilterEvent);
    on<SetCustomFilterEvent>(_setCustomFilterEvent);
    on<AddGuestEvent>(_addGuestEvent);
    on<ToggleGuestEvent>(_toggleGuestEvent);
  }

  void setInvitedFilterEvent() => add(SetInvitedFilterEvent());
  void setAllFilterEvent() => add(SetAllFilterEvent());
  void setNoInvitedFilterEvent() => add(SetNoInvitedFilterEvent());
  void setCustomFilterEvent(GuestFilter event) =>
      add(SetCustomFilterEvent(event));

  void addGuestEvent(String name) => add(AddGuestEvent(name: name));
  void toggleGuestEvent(String id) => add(ToggleGuestEvent(id: id));

  void _setInvitedFilterEvent(
          SetInvitedFilterEvent event, Emitter<GuestsState> emit) =>
      emit(state.copyWith(filter: GuestFilter.invited));

  void _setAllFilterEvent(SetAllFilterEvent event, Emitter<GuestsState> emit) =>
      emit(state.copyWith(filter: GuestFilter.all));

  void _setNoInvitedFilterEvent(
          SetNoInvitedFilterEvent event, Emitter<GuestsState> emit) =>
      emit(state.copyWith(filter: GuestFilter.noInvited));

  void _setCustomFilterEvent(
          SetCustomFilterEvent event, Emitter<GuestsState> emit) =>
      emit(state.copyWith(filter: event.newFilter));

  void _addGuestEvent(AddGuestEvent event, Emitter<GuestsState> emit) {
    final newGuest =
        Todo(id: uuid.v8(), description: event.name, completedAt: null);
    emit(state.copyWith(guests: [...state.guests, newGuest]));
  }

  void _toggleGuestEvent(ToggleGuestEvent event, Emitter<GuestsState> emit) {
    final newGuests = state.guests.map((guest) {
      if (guest.id == event.id) {
        return guest.copyWith(completedAt: !guest.done ? DateTime.now() : null);
      }

      return guest;
    }).toList();
    emit(state.copyWith(guests: newGuests));
  }
}
