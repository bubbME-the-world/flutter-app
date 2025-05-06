import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';
import '../core/service/dio_service.dart';
import '../data/datasource/authentication_data_source.dart';
import '../data/datasource/diary_data_source.dart';
import '../data/datasource/module_data_source.dart';
import '../data/datasource/mood_data_source.dart';
import '../data/datasource/period_data_source.dart';
import '../data/datasource/user_data_source.dart';
import '../data/model/language_model.dart';
import '../data/repositories/authentication_repository_impl.dart';
import '../data/repositories/diary_repository_impl.dart';
import '../data/repositories/module_repository_impl.dart';
import '../data/repositories/mood_repository_impl.dart';
import '../data/repositories/period_repository_impl.dart';
import '../data/repositories/user_repository_impl.dart';
import '../domain/repositories/authentication_repository.dart';
import '../domain/repositories/diary_repository.dart';
import '../domain/repositories/module_repository.dart';
import '../domain/repositories/mood_repository.dart';
import '../domain/repositories/period_repository.dart';
import '../domain/repositories/user_repository.dart';
import '../domain/usecases/add_diary_mood_usecase.dart';
import '../domain/usecases/add_diary_phobia_list_usecase.dart';
import '../domain/usecases/add_diary_usecase.dart';
import '../domain/usecases/add_diary_wish_list_usecase.dart';
import '../domain/usecases/add_mood_usecase.dart';
import '../domain/usecases/add_period_mood_usecase.dart';
import '../domain/usecases/add_period_note_usecase.dart';
import '../domain/usecases/add_period_pills_usecase.dart';
import '../domain/usecases/add_period_symptom_usecase.dart';
import '../domain/usecases/add_period_usecase.dart';
import '../domain/usecases/add_period_weight_usecase.dart';
import '../domain/usecases/diaries_usecase.dart';
import '../domain/usecases/diary_phobia_usecase.dart';
import '../domain/usecases/diary_usecase.dart';
import '../domain/usecases/get_period_note_usecase.dart';
import '../domain/usecases/get_period_pills_usecase.dart';
import '../domain/usecases/get_period_symptom_usecase.dart';
import '../domain/usecases/get_period_weight_usecase.dart';
import '../domain/usecases/get_symptom_usecase.dart';
import '../domain/usecases/login_email_usecase.dart';
import '../domain/usecases/login_usecase.dart';
import '../domain/usecases/modules_usecase.dart';
import '../domain/usecases/mood_today_usecase.dart';
import '../domain/usecases/moods_usecase.dart';
import '../domain/usecases/nodes_usecase.dart';
import '../domain/usecases/period_usecase.dart';
import '../domain/usecases/profile_local_usecase.dart';
import '../domain/usecases/profile_usecase.dart';
import '../domain/usecases/regis_email_usecase.dart';
import '../domain/usecases/regis_usecase.dart';
import '../domain/usecases/slides_usecase.dart';
import '../domain/usecases/verify_otp_usecase.dart';
import '../utils/controllers/language_controller.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerLazySingleton<Dio>(
    () => dioServices(),
  );

  // Data Source
  injector.registerLazySingleton(() => AuthenticationDataSource(injector()));
  injector.registerLazySingleton(() => MoodDataSource(injector()));
  injector.registerLazySingleton(() => UserDataSource(injector()));
  injector.registerLazySingleton(() => DiaryDataSource(injector()));
  injector.registerLazySingleton(() => ModuleDataSource(injector()));
  injector.registerLazySingleton(() => PeriodDataSource(injector()));

  // Repository
  injector.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      dataSource: injector(),
    ),
  );
  injector.registerLazySingleton<MoodRepository>(
    () => MoodRepositoryImpl(
      dataSource: injector(),
    ),
  );
  injector.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      dataSource: injector(),
    ),
  );
  injector.registerLazySingleton<DiaryRepository>(
    () => DiaryRepositoryImpl(
      dataSource: injector(),
    ),
  );
  injector.registerLazySingleton<ModuleRepository>(
    () => ModuleRepositoryImpl(
      dataSource: injector(),
    ),
  );
  injector.registerLazySingleton<PeriodRepository>(
    () => PeriodRepositoryImpl(
      dataSource: injector(),
    ),
  );

  // UseCase
  injector.registerLazySingleton(() => LoginUseCase(injector()));
  injector.registerLazySingleton(() => LoginEmailUseCase(injector()));
  injector.registerLazySingleton(() => RegisUseCase(injector()));
  injector.registerLazySingleton(() => RegisEmailUseCase(injector()));
  injector.registerLazySingleton(() => VerifyOTPUseCase(injector()));
  injector.registerLazySingleton(() => MoodsUseCase(injector()));
  injector.registerLazySingleton(() => AddMoodUseCase(injector()));
  injector.registerLazySingleton(() => MoodTodayUseCase(injector()));
  injector.registerLazySingleton(() => ProfileUseCase(injector()));
  injector.registerLazySingleton(() => ProfileLocalUseCase(injector()));
  injector.registerLazySingleton(() => DiariesUseCase(injector()));
  injector.registerLazySingleton(() => DiaryUseCase(injector()));
  injector.registerLazySingleton(() => DiaryPhobiaUseCase(injector()));
  injector.registerLazySingleton(() => AddDiaryUseCase(injector()));
  injector.registerLazySingleton(() => AddDiaryMoodUseCase(injector()));
  injector.registerLazySingleton(() => AddDiaryWishListUseCase(injector()));
  injector.registerLazySingleton(() => AddDiaryPhobiaListUseCase(injector()));
  injector.registerLazySingleton(() => ModulesUseCase(injector()));
  injector.registerLazySingleton(() => NodesUseCase(injector()));
  injector.registerLazySingleton(() => SlidesUseCase(injector()));
  injector.registerLazySingleton(() => PeriodUseCase(injector()));
  injector.registerLazySingleton(() => AddPeriodUseCase(injector()));
  injector.registerLazySingleton(() => AddPeriodNoteUseCase(injector()));
  injector.registerLazySingleton(() => GetPeriodNoteUseCase(injector()));
  injector.registerLazySingleton(() => AddPeriodPillsUseCase(injector()));
  injector.registerLazySingleton(() => GetPeriodPillsUseCase(injector()));
  injector.registerLazySingleton(() => AddPeriodWeightUseCase(injector()));
  injector.registerLazySingleton(() => GetPeriodWeightUseCase(injector()));
  injector.registerLazySingleton(() => AddPeriodMoodUseCase(injector()));
  injector.registerLazySingleton(() => GetSymptomUseCase(injector()));
  injector.registerLazySingleton(() => GetPeriodSymptomUseCase(injector()));
  injector.registerLazySingleton(() => AddPeriodSymptomUseCase(injector()));
}

Future<Map<String, Map<String, String>>> init() async {
  final sharedPreference = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreference);
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));

  Map<String, Map<String, String>> languages = {};
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle
        .loadString('assets/locales/${languageModel.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);

    Map<String, String> jsonData = {};
    mappedJson.forEach((key, value) {
      jsonData[key] = value.toString();
    });

    languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        jsonData;
  }
  return languages;
}
