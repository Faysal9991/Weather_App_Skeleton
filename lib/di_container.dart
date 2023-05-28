
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/data/datasource/dio/dio_client.dart';
import 'package:weather_app/data/datasource/dio/logging_interceptor.dart';
import 'package:weather_app/data/repository/weather_repo.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/util/app_conostant.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // Core

  sl.registerLazySingleton(() => DioClient(AppConstant.baseUrl, sl(), sharedPreferences: sl(), loggingInterceptor: sl()));
  // Repository
  sl.registerLazySingleton(() => WeatherRepo( dioClient: sl()));

  // Provider

  sl.registerFactory(() => WeatherProvider(weatherRepo: sl()));



  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}