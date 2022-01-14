import 'package:dio/dio.dart';
import 'package:flutter_mvvm/di/module/local_module.dart';
import 'package:flutter_mvvm/di/module/network_module.dart';
import 'package:flutter_mvvm/network/api_handler.dart';
import 'package:flutter_mvvm/network/dio_client.dart';
import 'package:flutter_mvvm/sharedpref/shared_prefrenses.dart';
import 'package:flutter_mvvm/stores/error_store.dart';
import 'package:flutter_mvvm/stores/theme_store.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../network/repositories/pre_login_repository.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  //Errors

  getIt.registerFactory(() => ErrorStore());

  //async call
  getIt.registerSingletonAsync<SharedPreferences>(
      () => LocalModule.provideSharedPreferences());

  //singleton
  getIt.registerSingleton(
      SharedPreferencesHelper(await getIt.getAsync<SharedPreferences>()));
  getIt.registerSingleton<Dio>(
      NetWorkModule.provideDioClient(getIt.get<SharedPreferencesHelper>()));
  getIt.registerSingleton<DioClient>(DioClient(getIt.get<Dio>()));

  //Api handler
  getIt.registerSingleton(APIHandler(getIt.get<DioClient>()));

  //Repository
  getIt.registerSingleton(PreLoginRepository(
      getIt.get<APIHandler>(), getIt.get<SharedPreferencesHelper>()));

  //Stores
  getIt.registerSingleton(ThemeStore());
}
