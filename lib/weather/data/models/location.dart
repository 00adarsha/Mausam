import 'dart:convert';

List<Location> locationFromJson(String str) =>
    List<Location>.from(json.decode(str).map((x) => Location.fromJson(x)));

String locationToJson(List<Location> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Location {
  Location({
    required this.name,
    required this.localNames,
    required this.lat,
    required this.lon,
    required this.country,
  });

  final String name;
  final Map<String, String> localNames;
  final double lat;
  final double lon;
  final String country;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        localNames: Map.from(json["local_names"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "local_names":
            Map.from(localNames).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "lat": lat,
        "lon": lon,
        "country": country,
      };
}
