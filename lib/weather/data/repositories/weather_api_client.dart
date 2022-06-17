import 'package:http/http.dart' as http;
import 'package:mausam/weather/data/models/location.dart';
import 'package:mausam/weather/data/models/weather.dart';

class WeatherApiClient {
  WeatherApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'api.openweathermap.org';
  static const _appId = 'c011671971f34af24d2b0e4a4bbdbf76';
  final http.Client _httpClient;

  Future<Location> searchLocation(String city) async {
    final uri = Uri.https(
      _baseUrl,
      'geo/1.0/direct',
      <String, String>{'q': city, 'appid': _appId},
    );
    final response = await _httpClient.get(uri);
    if (response.statusCode == 200) {
      return locationFromJson(response.body).first;
    } else {
      throw Exception('Failed to load location');
    }
  }

  Future<Weather> getWeather(double latitude, double longitude) async {
    final uri = Uri.https(
      _baseUrl,
      'data/2.5/weather',
      <String, String>{
        'lat': latitude.toString(),
        'lon': longitude.toString(),
        'appid': _appId,
      },
    );
    final response = await _httpClient.get(uri);
    if (response.statusCode == 200) {
      return weatherFromJson(response.body);
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
