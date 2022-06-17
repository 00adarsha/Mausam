import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mausam/theme/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeDark());

  toggleTheme() {
    state is ThemeDark ? emit(ThemeLight()) : emit(ThemeDark());
  }
}
