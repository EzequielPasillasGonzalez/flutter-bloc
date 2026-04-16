import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gelocation_state.dart';

class GelocationCubit extends Cubit<GelocationState> {
  GelocationCubit() : super(const GelocationState());

  Future<void> checkStatus() async {}

  void watchUserLocation() {}
}
