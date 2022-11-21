import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:com.petroimensharif.pishco/data/local/dataSources/user_dataSource.dart';
import 'package:com.petroimensharif.pishco/data/network/apis/login/users_api.dart';
import 'package:com.petroimensharif.pishco/data/network/dio_client.dart';
import 'package:com.petroimensharif.pishco/data/network/rest_client.dart';
import 'package:com.petroimensharif.pishco/data/sharedpref/shared_preference_helper.dart';
import 'package:com.petroimensharif.pishco/di/modules/local_module.dart';
import 'package:com.petroimensharif.pishco/di/modules/netwok_module.dart';
import 'package:com.petroimensharif.pishco/di/modules/preference_module.dart';
import 'package:com.petroimensharif.pishco/domain/repositories/user_repository.dart';
import 'package:com.petroimensharif.pishco/domain/viewmodel/base_view_model.dart';
import 'package:com.petroimensharif.pishco/domain/viewmodel/login_view_model.dart';
import 'package:com.petroimensharif.pishco/domain/viewmodel/user_view_model.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // async singletons:----------------------------------------------------------
  getIt.registerSingletonAsync<SharedPreferences>(
      () => PreferenceModule.provideSharedPreferences());

  getIt.registerSingletonAsync<Database>(() => LocalModule.provideDatabase());
  // singletons:----------------------------------------------------------------
  getIt.registerSingleton(
      SharedPreferenceHelper(getIt.getAsync<SharedPreferences>()));
  getIt.registerSingleton<Dio>(
      NetworkModule.provideDio(getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(RestClient());
  // api's:---------------------------------------------------------------------
  getIt.registerSingleton(UsersApi(getIt<DioClient>()));
  getIt.registerSingleton(UserDataSource(getIt.getAsync<Database>()));
  // repository:----------------------------------------------------------------
  getIt.registerSingleton(UserRepository(
    getIt<UsersApi>(),
    getIt<UserDataSource>(),
  ));

  // view models:---------------------------------------------------------------
  getIt.registerFactory(() => LoginViewModel());
  getIt.registerFactory(() => UserViewModel());

}
