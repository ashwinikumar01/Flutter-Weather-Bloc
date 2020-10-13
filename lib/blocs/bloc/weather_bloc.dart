import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_weather_bloc/models/weather.dart';
import 'package:meta/meta.dart';
import 'package:flutter_weather_bloc/blocs/blocs.dart';
import 'package:flutter_weather_bloc/repositories/repositories.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield WeatherLoadInProgress();
      try {
        final Weather weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoadSuccess(weather: weather);
      } catch (e) {
        WeatherLoadFailre();
      }
    }
  }
}
