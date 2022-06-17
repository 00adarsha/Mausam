import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mausam/weather/cubit/unit_cubit.dart';
import 'package:mausam/widgets/secondary_background.dart';

class TemperatureView extends StatelessWidget {
  const TemperatureView({
    Key? key,
    required this.feelsLike,
    required this.temperature,
    required this.maximumTemperature,
    required this.minimumTemperature,
  }) : super(key: key);

  final double feelsLike;
  final double temperature;
  final double maximumTemperature;
  final double minimumTemperature;

  @override
  Widget build(BuildContext context) {
    return SecondaryBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8.0),
          BlocBuilder<UnitCubit, UnitState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state is UnitFahranheit
                        ? '$feelsLike \u00B0F'
                        : '${((feelsLike - 32) * (5 / 9)).toStringAsFixed(2)} \u00B0C',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state is UnitFahranheit
                            ? '$temperature \u00B0F'
                            : '${((temperature - 32) * (5 / 9)).toStringAsFixed(2)} \u00B0C',
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        state is UnitFahranheit
                            ? 'Max: $temperature \u00B0F'
                            : 'Max: ${((maximumTemperature - 32) * (5 / 9)).toStringAsFixed(2)} \u00B0C',
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        state is UnitFahranheit
                            ? 'Min: $temperature \u00B0F'
                            : 'Min: ${((minimumTemperature - 32) * (5 / 9)).toStringAsFixed(2)} \u00B0C',
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
