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
      temp: json['main']['temp'].toString(),
      mode: json['weather'][0]['main'].toString(),
      max: json['main']['temp_max'].toString(),
      min: json['main']['temp_min'].toString(),
      windSpeed: json['wind']['speed'].toString(),
      humidity: json['main']['humidity'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': cityName,
      'weather': [
        {
          'main': mode,
        }
      ],
      'wind': {'speed': windSpeed},
      'main': {
        'temp_min': min,
        'temp_max': max,
        'temp': temp,
        'humidity': humidity,
      },
    };
  }
}
