import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    bool darkMode =
        false, // Cuando instancian el cubit puede mandar el parametro
  }) : super(ThemeState(isDarkMode: darkMode));

  void toggleTheme() {
    emit(ThemeState(isDarkMode: !state.isDarkMode));
  }

  void setDarkMode() {
    emit(ThemeState(isDarkMode: true));
  }

  void setLightMode() {
    emit(ThemeState(isDarkMode: false));
  }
}
