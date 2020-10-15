import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_weather_bloc/blocs/blocs.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc()
      : super(SettingState(temperatureUnits: TemperatureUnits.celsius));

  @override
  Stream<SettingState> mapEventToState(SettingEvent event) async* {
    if (event is TemperatureUnitsToggled) {
      yield SettingState(
        temperatureUnits: state.temperatureUnits == TemperatureUnits.celsius
            ? TemperatureUnits.fahrenheit
            : TemperatureUnits.celsius,
      );
    }
  }
}
