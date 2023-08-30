import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_by_gps_test/core/error/exception.dart';
import 'package:weather_by_gps_test/features/weather/data/models/current_temp_model.dart';
import 'package:weather_by_gps_test/features/weather/data/models/future_temp_model.dart';

abstract class WeatherRemoteDataSource {
  Future<CurrentTempModel> getCurrentTemp(String latitude, String longitude);

  Future<List<FutureTempModel>> getFutureTemp(String latitude, String longitude);
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  final apiKey = 'abf27e7753f01b857aeeffdbbfaa9fd5';

  final http.Client client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<CurrentTempModel> getCurrentTemp(String latitude, String longitude) async {
    final apiUrl = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric&lang=ru';
    final response = await client.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return CurrentTempModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<FutureTempModel>> getFutureTemp(String latitude, String longitude) async {
    final forecastUrl = 'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric&lang=ru';
    final response = await client.get(Uri.parse(forecastUrl));
    if (response.statusCode == 200) {
      List<FutureTempModel> futureTempModelList = [];
      for (var i = 0; i < 4; i++) {
        futureTempModelList.add(FutureTempModel.fromJson(json.decode(response.body)['list'][i]));
      }
      return futureTempModelList;
    } else {
      throw ServerException();
    }
  }
}
