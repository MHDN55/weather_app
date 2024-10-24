import 'package:flutter/material.dart';
import 'package:weather_clean/features/weather/presentation/pages/weather_page.dart';
// import 'injection_container.dart' as di;
import 'injection_injectable_package.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.configureDependencies();
  // await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}
