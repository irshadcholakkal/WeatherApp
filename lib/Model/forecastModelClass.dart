// To parse this JSON data, do
//
//     final forecastDatas = forecastDatasFromJson(jsonString);

// import 'dart:convert';

// forecastDatas forecastDatasFromJson(String str) => forecastDatas.fromJson(json.decode(str));

// String forecastDatasToJson(forecastDatas data) => json.encode(data.toJson());

class forecastDatas {
  int? message;
  int? cnt;
  int? id;
  String? name;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  double? tempKf;
  double? speed;
  double? the3H;
  double? temb0;

  String? description;
  String? icon;
  int? all;
  DateTime? dtTxt;

  forecastDatas({
    this.temb0,
    required this.message,
    required this.cnt,
    required this.id,
    required this.name,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
    required this.speed,
    required this.description,
    required this.icon,
    required this.the3H,
    required this.all,
    required this.dtTxt,
  });

  forecastDatas.fromJson(Map<String, dynamic> json) {
    temb0 = json["list"][0]["main"]["temp"];
  }
}

// class City {
   

//     City({
       
//     });

//     factory City.fromJson(Map<String, dynamic> json) => City(
//         id: json["id"],
//         name: json["name"],
//         coord: Coord.fromJson(json["coord"]),
//         country: json["country"],
//         population: json["population"],
//         timezone: json["timezone"],
//         sunrise: json["sunrise"],
//         sunset: json["sunset"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "coord": coord.toJson(),
//         "country": country,
//         "population": population,
//         "timezone": timezone,
//         "sunrise": sunrise,
//         "sunset": sunset,
//     };
// }

// class Coord {
//     double lat;
//     double lon;

//     Coord({
//         required this.lat,
//         required this.lon,
//     });

//     factory Coord.fromJson(Map<String, dynamic> json) => Coord(
//         lat: json["lat"]?.toDouble(),
//         lon: json["lon"]?.toDouble(),
//     );

//     Map<String, dynamic> toJson() => {
//         "lat": lat,
//         "lon": lon,
//     };
// }

// class ListElement {
//     int? dt;
//     MainClass main;
//     List<Weather> weather;
//     Clouds clouds;
//     Wind wind;
//     int visibility;
//     double pop;
//     Rain? rain;
//     Sys sys;
    

//     ListElement({
//         required this.dt,
//         required this.main,
//         required this.weather,
//         required this.clouds,
//         required this.wind,
//         required this.visibility,
//         required this.pop,
//         this.rain,
//         required this.sys,
        
        
//     });

//     factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         dt: json["dt"],
//         main: MainClass.fromJson(json["main"]),
//         weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
//         clouds: Clouds.fromJson(json["clouds"]),
//         wind: Wind.fromJson(json["wind"]),
//         visibility: json["visibility"],
//         pop: json["pop"]?.toDouble(),
//         rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
//         sys: Sys.fromJson(json["sys"]),
//         dtTxt: DateTime.parse(json["dt_txt"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "dt": dt,
//         "main": main.toJson(),
//         "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
//         "clouds": clouds.toJson(),
//         "wind": wind.toJson(),
//         "visibility": visibility,
//         "pop": pop,
//         "rain": rain?.toJson(),
//         "sys": sys.toJson(),
//         "dt_txt": dtTxt.toIso8601String(),
//     };
// }

