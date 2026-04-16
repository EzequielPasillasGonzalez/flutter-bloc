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
}
