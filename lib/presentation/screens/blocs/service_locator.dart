import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/screens/blocs/blocs.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.asNewInstance();

void serviceLocatorInit() {
  //* Se instansea como un singleton
  getIt.registerSingleton(UsernameCubit());
  getIt.registerSingleton(RouterSimplecubit());
  getIt.registerSingleton(ThemeCubit());
  getIt.registerSingleton(CounterCubit());
  getIt.registerSingleton(GuestsBloc());

  // Se inyecta la dependencia al bloc
  getIt.registerSingleton(
      PokemonBloc(fetchPokemon: PokemonInformation.getPokemonName));

//* Diferentes manera de enviar la funcion necesaria
  // final historyBloc = getIt.registerSingleton(HistoryLocationBloc());
  getIt.registerSingleton(HistoryLocationBloc());

// En cuanto se crea, empezamos a escuchar la ubicacion del usuario
  getIt.registerSingleton(GelocationCubit(
      // onNewUserLocationCallback: historyBloc.onNewUserLocation,
      onNewUserLocationCallback: getIt<HistoryLocationBloc>().onNewUserLocation)
    ..watchUserLocation());
}
