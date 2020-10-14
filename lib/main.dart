import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_bloc/blocs/blocs.dart';
import 'package:flutter_weather_bloc/blocs/theme/theme_bloc.dart';
import 'package:flutter_weather_bloc/blocs/theme/theme_bloc.dart';
import 'package:flutter_weather_bloc/repositories/repositories.dart';
import 'package:flutter_weather_bloc/simple_bloc_observer.dart';
import 'package:flutter_weather_bloc/widgets/weather.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_weather_bloc/widgets/widgets.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(
    BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: App(weatherRepository: weatherRepository),
    ),
  );
}

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  const App({Key key, this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Weather',
          theme: themeState.theme,
          home: BlocProvider(
            create: (context) =>
                WeatherBloc(weatherRepository: weatherRepository),
            child: Weather(),
          ),
        );
      },
    );
  }
}
