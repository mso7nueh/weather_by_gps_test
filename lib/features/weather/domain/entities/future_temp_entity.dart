import 'package:equatable/equatable.dart';

class FutureTempEntity extends Equatable {
  final String date, temp, mode;

  const FutureTempEntity({required this.date, required this.temp, required this.mode});

  @override
  List<Object?> get props => [date, temp, mode];
}
