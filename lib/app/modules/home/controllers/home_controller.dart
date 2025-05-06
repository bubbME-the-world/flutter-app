import 'package:bubbme/app/core/service/network_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base_controller.dart';
import '../../../core/request_state.dart';
import '../../../di/injectore.dart';
import '../../../domain/entity/profile.dart';
import '../../../domain/usecases/profile_usecase.dart';
import '../../../routes/app_pages.dart';
import '../../../shared_ui/style/app_audios.dart';

class HomeController extends BaseController {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  final _profileUseCase = injector<ProfileUseCase>();

  final profileState = const RequestState<Profile>.initial().obs;

  @override
  void onInit() {
    super.onInit();
    setAudio(AppAudios.mainSong);
  }

  Future<void> getProfile() async {
    profileState.value = const RequestState<Profile>.loading();

    final result = await _profileUseCase.execute();
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        profileState.value = RequestState.error(errorMessage);
      },
      (data) => profileState.value = RequestState<Profile>.success(data),
    );
  }

  void navigateTo(String key, String value) {
    if (key == 'REQUEST_SCENE') {
      if (value == 'PERIOD') {
        showPeriod();
      } else if (value == 'DIARY') {
        showDiary();
      } else if (value == 'LECTURE') {
        showModule();
      } else if (value == 'REPORT') {
        showReport();
      } else if (value == 'SETTING') {
        showSettingDialog();
      }
    }
  }

  void showPeriod() => Get.toNamed(Routes.PERIOD);

  void showDiary() => Get.toNamed(Routes.DIARY);

  void showModule() => Get.toNamed(Routes.MODULE);

  void showReport() => Get.toNamed(Routes.REPORT);
}
