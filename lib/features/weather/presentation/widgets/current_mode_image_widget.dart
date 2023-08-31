import 'package:flutter/material.dart';

class CurrentModeImageWidget extends StatefulWidget {
  final String mode;

  const CurrentModeImageWidget({super.key, required this.mode});

  @override
  State<CurrentModeImageWidget> createState() => _CurrentModeImageWidgetState();
}

class _CurrentModeImageWidgetState extends State<CurrentModeImageWidget> {
  late String imageAsset;

  @override
  void initState() {
    super.initState();
    switch (widget.mode) {
      case 'Rain':
        imageAsset = 'assets/images/rainfall.png';
        break;
      case 'Snow':
        imageAsset = 'assets/images/snow.png';
        break;
      case 'Clouds':
        imageAsset = 'assets/images/sun.png';
        break;
      case 'Clear':
        imageAsset = 'assets/images/sun.png';
        break;
      case 'Atmosphere':
        imageAsset = 'assets/images/sun.png';
        break;
      case 'Drizzle':
        imageAsset = 'assets/images/rain.png';
        break;
      case 'Thunderstorm':
        imageAsset = 'assets/images/lightning.png';
        break;
      default:
        imageAsset = 'assets/images/sun.png';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: Image.asset(imageAsset),
    );
  }
}
