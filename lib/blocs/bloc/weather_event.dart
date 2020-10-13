import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

//Whenever a user inputs a city, we will add a WeatherRequested event with
//the given city and our bloc will be responsible for figuring out what the
//weather is there and returning a new WeatherState.

class WeatherRequested extends WeatherEvent {
  final String city;

  WeatherRequested({@required this.city});

  @override
  List<Object> get props => [city];
}
