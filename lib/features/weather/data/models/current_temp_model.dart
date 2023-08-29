import 'package:weather_by_gps_test/features/weather/domain/entities/current_temp_entity.dart';

class CurrentTempModel extends CurrentTempEntity {
  const CurrentTempModel({
    required super.cityName,
    required super.temp,
    required super.mode,
    required super.max,
    required super.min,
    required super.windSpeed,
    required super.humidity,
  });

  factory CurrentTempModel.fromJson(Map<String, dynamic> json) {
    return CurrentTempModel(
      cityName: json['name'].toString(),
      temp: json['main']['temp'].toStringAsFixed(0),
      mode: json['weather'][0]['main'].toString(),
      max: json['main']['temp_max'].toStringAsFixed(0),
      min: json['main']['temp_min'].toStringAsFixed(0),
      windSpeed: json['wind']['speed'].toStringAsFixed(0),
      humidity: json['main']['humidity'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cityName': cityName,
      'temp': temp,
      'mode': mode,
      'max': max,
      'min': min,
      'windSpeed': windSpeed,
      'humidity': humidity,
    };
  }
}
