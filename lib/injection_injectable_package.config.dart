// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i3;

import 'core/network/network_info.dart' as _i5;
import 'features/weather/data/datasources/weather_remote_data_source.dart'
    as _i6;
import 'features/weather/data/repositories/weather_repositories_impl.dart'
    as _i8;
import 'features/weather/domain/repositories/weather_repositories.dart' as _i7;
import 'features/weather/domain/usecases/get_weather_usecase.dart' as _i9;
import 'features/weather/presentation/blocs/weather/weather_bloc.dart' as _i10;
import 'injection_injectable_package.dart' as _i11;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.InternetConnection>(
      () => registerModule.internetConnection);
  gh.lazySingleton<_i4.Client>(() => registerModule.client);
  gh.lazySingleton<_i5.NetworkInfo>(
      () => _i5.NetworkInfoImpl(gh<_i3.InternetConnection>()));
  gh.lazySingleton<_i6.WeatherRemoteDataSource>(
      () => _i6.WeatherRemoteDataSourceImpl(client: gh<_i4.Client>()));
  gh.lazySingleton<_i7.WeatherRepository>(() => _i8.WeatherRepositoriesImpl(
        remoteDataSource: gh<_i6.WeatherRemoteDataSource>(),
        networkInfo: gh<_i5.NetworkInfo>(),
      ));
  gh.lazySingleton<_i9.GetWeatherUsecase>(
      () => _i9.GetWeatherUsecase(gh<_i7.WeatherRepository>()));
  gh.lazySingleton<_i10.WeatherBloc>(
      () => _i10.WeatherBloc(getWeather: gh<_i9.GetWeatherUsecase>()));
  return getIt;
}

class _$RegisterModule extends _i11.RegisterModule {}
