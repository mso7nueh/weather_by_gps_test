import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_by_gps_test/core/error/exception.dart';
import 'package:weather_by_gps_test/features/weather/data/models/current_temp_model.dart';
import 'package:weather_by_gps_test/features/weather/data/models/future_temp_model.dart';

abstract class WeatherLocalDataSource {
  Future<void> saveCurrentTempToCache(CurrentTempModel currentTempModel);

  Future<void> saveFutureTempToCache(List<FutureTempModel> futureTempModelList);

  Future<CurrentTempModel> getCurrentTempFromCache();

  Future<List<FutureTempModel>> getFutureTempFromCache();
}

const CACHED_FUTURE_TEMP_MODEL_LIST = 'CACHED_FUTURE_TEMP_MODEL_LIST';
const CACHED_CURRENT_TEMP_MODEL = 'CACHED_CURRENT_TEMP_MODEL';

class WeatherLocalDataSourceImpl extends WeatherLocalDataSource {
  final SharedPreferences sharedPreferences;

  WeatherLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<CurrentTempModel> getCurrentTempFromCache() {
    final jsonCurrentTempModel = sharedPreferences.getString(CACHED_CURRENT_TEMP_MODEL);
    if (jsonCurrentTempModel != null && jsonCurrentTempModel.isNotEmpty) {
      return Future.value(CurrentTempModel.fromJson(json.decode(jsonCurrentTempModel)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<FutureTempModel>> getFutureTempFromCache() {
    final jsonFutureTempModelList = sharedPreferences.getStringList(CACHED_FUTURE_TEMP_MODEL_LIST);
    if (jsonFutureTempModelList != null && jsonFutureTempModelList.isNotEmpty) {
      return Future.value(jsonFutureTempModelList.map((futureTempModel) => FutureTempModel.fromJson(json.decode(futureTempModel))).toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<String> saveCurrentTempToCache(CurrentTempModel currentTempModel) {
    final String jsonCurrentTempModel = json.encode(currentTempModel.toJson());
    sharedPreferences.setString(CACHED_CURRENT_TEMP_MODEL, jsonCurrentTempModel);
    return Future.value(jsonCurrentTempModel);
  }

  @override
  Future<List<String>> saveFutureTempToCache(List<FutureTempModel> futureTempModelList) {
    final List<String> jsonFutureTempModelList = futureTempModelList.map((futureTempModel) => json.encode(futureTempModel.toJson())).toList();
    sharedPreferences.setStringList(CACHED_FUTURE_TEMP_MODEL_LIST, jsonFutureTempModelList);
    return Future.value(jsonFutureTempModelList);
  }
}
