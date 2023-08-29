import 'package:weather_by_gps_test/features/weather/domain/entities/future_temp_entity.dart';

class FutureTempModel extends FutureTempEntity {
  const FutureTempModel({required super.date, required super.temp, required super.mode});

  factory FutureTempModel.fromJson(Map<String, dynamic> json) {
    return FutureTempModel(
      date: json['dt_txt'].toString(),
      temp: json['main']['temp'].toStringAsFixed(0),
      mode: json['weather'][0]['main'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'temp': temp,
      'mode': mode,
    };
  }
}
