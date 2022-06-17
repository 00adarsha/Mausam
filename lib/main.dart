import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mausam/dashboard.dart';
import 'package:mausam/theme/cubit/theme_cubit.dart';
import 'package:mausam/theme/theme.dart';
import 'package:mausam/weather/cubit/unit_cubit.dart';
import 'package:mausam/weather/cubit/weather_cubit.dart';
import 'package:mausam/weather/data/repositories/weather_repository.dart';

void main() => runApp(const Mausam());

class Mausam extends StatelessWidget {
  const Mausam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => UnitCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return CupertinoApp(
            theme: state is ThemeDark ? Theme.dark : Theme.light,
            home: BlocProvider(
              create: (context) =>
                  WeatherCubit(WeatherRepository())..getWeather('Kathmandu'),
              child: const Dashboard(),
            ),
          );
        },
      ),
    );
  }
}
