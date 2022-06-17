import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mausam/settings/settings.dart';
import 'package:mausam/weather/cubit/unit_cubit.dart';
import 'package:mausam/weather/cubit/weather_cubit.dart';
import 'package:mausam/weather/temperature_view.dart';
import 'package:mausam/widgets/secondary_background.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Mausam'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => const Settings()));
          },
          child: const Icon(CupertinoIcons.settings),
        ),
        border: null,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoaded) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SecondaryBackground(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.weather.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                      const SizedBox(height: 16.0),
                      TemperatureView(
                        feelsLike: state.weather.main.feelsLike,
                        temperature: state.weather.main.temp,
                        maximumTemperature: state.weather.main.tempMax,
                        minimumTemperature: state.weather.main.tempMin,
                      ),
                      const SizedBox(height: 16.0),
                      SecondaryBackground(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  state.weather.weather.first.main,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(state.weather.weather.first.description),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  );
                }
                if (state is WeatherLoading) {
                  return SecondaryBackground(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: CupertinoActivityIndicator(),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
