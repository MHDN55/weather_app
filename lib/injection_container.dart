// import 'package:weather_clean/features/weather/data/datasources/weather_remote_data_source.dart';
// import 'package:weather_clean/features/weather/data/repositories/weather_repositories_impl.dart';
// import 'package:weather_clean/features/weather/domain/repositories/weather_repositories.dart';
// import 'package:weather_clean/features/weather/domain/usecases/get_weather_usecase.dart';
// import 'package:weather_clean/features/weather/presentation/blocs/weather/weather_bloc.dart';

// import 'core/network/network_info.dart';
// import 'package:get_it/get_it.dart';
// import 'package:http/http.dart' as http;
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// final sl = GetIt.instance;

// Future<void> init() async {
// // Features - weather :

//   // bloc

//   sl.registerFactory(() => WeatherBloc(getWeather: sl()));


//   // usecases

//   sl.registerLazySingleton(() => GetWeatherUsecase(sl()));


//   // Repository

//   sl.registerLazySingleton<WeatherRepository>(
//     () => WeatherRepositoriesImpl(
//         remoteDataSource: sl(),  networkInfo: sl()),
//   );

//   // datasources

//   sl.registerLazySingleton<WeatherRemoteDataSource>(
//       () => WeatherRemoteDataSourceImpl(client: sl()));


// // Core

//   sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

// // External
//   final SharedPreferences sharedPreferences =
//       await SharedPreferences.getInstance();

//   sl.registerLazySingleton(() => sharedPreferences);
//   sl.registerLazySingleton(() => http.Client());
//   sl.registerLazySingleton(() => InternetConnectionChecker());
// }
