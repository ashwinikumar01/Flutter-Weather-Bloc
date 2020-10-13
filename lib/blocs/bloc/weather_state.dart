import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_weather_bloc/models/weather.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final Weather weather;

  WeatherLoadSuccess({@required this.weather}) : assert(weather != null);
  @override
  List<Object> get props => [weather];
}

class WeatherLoadFailre extends WeatherState {}
