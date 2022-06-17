import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mausam/weather/data/models/weather.dart';
import 'package:mausam/weather/data/repositories/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(WeatherInitial());
  final WeatherRepository _weatherRepository;

  Future<void> getWeather(String city) async {
    emit(WeatherLoading());
    final weather = await _weatherRepository.getWeather(city);
    emit(WeatherLoaded(weather: weather));
  }
}
