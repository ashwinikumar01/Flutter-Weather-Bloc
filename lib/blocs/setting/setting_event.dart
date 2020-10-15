import 'package:equatable/equatable.dart';

abstract class SettingEvent extends Equatable {}

class TemperatureUnitsToggled extends SettingEvent {
  @override
  List<Object> get props => [];
}
