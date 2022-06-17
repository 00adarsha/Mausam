import 'package:mausam/weather/data/models/weather.dart';
import 'package:mausam/weather/data/repositories/weather_api_client.dart';

class WeatherRepository {
  WeatherRepository({WeatherApiClient? weatherApiClient})
      : _weatherApiClient = weatherApiClient ?? WeatherApiClient();

  final WeatherApiClient _weatherApiClient;

  Future<Weather> getWeather(String city) async {
    final location = await _weatherApiClient.searchLocation(city);
    return _weatherApiClient.getWeather(location.lat, location.lon);
  }
}
