import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_clean/core/widgets/loading_widget.dart';
import 'package:weather_clean/features/weather/presentation/blocs/weather/weather_bloc.dart';
import 'package:weather_clean/features/weather/presentation/widgets/message_display_widget.dart';
import 'package:weather_clean/features/weather/presentation/widgets/weather_widget.dart';
import 'package:weather_clean/injection_injectable_package.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    getIt<WeatherBloc>().add(GetWeatherEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: getIt<WeatherBloc>()..add(GetWeatherEvent()),
      builder: (context, state) {
        if (state is LoadingWeatherState) { 
          return const LoadingWidget();
        } else if (state is LoadedWeatherState) {
          return RefreshIndicator(
              backgroundColor: Colors.black,
              color: Colors.white,
              onRefresh: () => _onRefresh(context),
              child: WeatherWidget(weather: state.weather));
        } else if (state is ErrorWeatherState) {
          return MessageDisplay(message: state.message);
        }
        return const LoadingWidget();
      },
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<WeatherBloc>(context).add(RefreshWeatherEvent());
  }
}
