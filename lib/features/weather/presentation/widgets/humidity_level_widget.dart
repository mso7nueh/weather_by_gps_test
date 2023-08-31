import 'package:flutter/material.dart';
import 'package:weather_by_gps_test/common/app_text_styles.dart';

class HumidityLevelWidget extends StatefulWidget {
  final String humidity;

  const HumidityLevelWidget({super.key, required this.humidity});

  @override
  State<HumidityLevelWidget> createState() => _HumidityLevelWidgetState();
}

class _HumidityLevelWidgetState extends State<HumidityLevelWidget> {
  late String humidityLevel;

  @override
  void initState() {
    super.initState();
    if (int.parse(widget.humidity) < 30) {
      humidityLevel = 'Низкая влажность';
    } else if (int.parse(widget.humidity) < 60) {
      humidityLevel = 'Нормальная влажность';
    } else {
      humidityLevel = 'Высокая влажность';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      humidityLevel,
      style: AppTextStyles.b2(
        Colors.white,
      ),
    );
  }
}
