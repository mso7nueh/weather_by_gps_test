import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_by_gps_test/common/app_text_styles.dart';

class FutureTempWidget extends StatefulWidget {
  final String time, mode, temp;

  const FutureTempWidget({super.key, required this.time, required this.mode, required this.temp});

  @override
  State<FutureTempWidget> createState() => _FutureTempWidgetState();
}

class _FutureTempWidgetState extends State<FutureTempWidget> {
  late String iconAsset;

  @override
  void initState() {
    super.initState();
    switch (widget.mode) {
      case 'Rain':
        iconAsset = 'assets/icons/cloudRain.svg';
        break;
      case 'Snow':
        iconAsset = 'assets/icons/cloudSnow.svg';
        break;
      case 'Clouds':
        iconAsset = 'assets/icons/cloudSun.svg';
        break;
      case 'Clear':
        iconAsset = 'assets/icons/sun.svg';
        break;
      case 'Atmosphere':
        iconAsset = 'assets/icons/sun.svg';
        break;
      case 'Drizzle':
        iconAsset = 'assets/icons/cloudRain.svg';
        break;
      case 'Thunderstorm':
        iconAsset = 'assets/icons/cloudLightning.svg';
        break;
      default:
        iconAsset = 'assets/icons/sun.svg';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            widget.time.substring(11, widget.time.length - 3),
            style: AppTextStyles.b2(Colors.white),
          ),
          const SizedBox(
            height: 16.0,
          ),
          SvgPicture.asset(
            iconAsset,
            width: 32.0,
            height: 32.0,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            '${double.parse(widget.temp).toStringAsFixed(0)}º',
            style: AppTextStyles.b1Medium(
              Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
