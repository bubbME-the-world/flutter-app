import 'package:bubbme/app/core/base_controller.dart';
import 'package:bubbme/app/core/service/network_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/request_state.dart';
import '../../../di/injectore.dart';
import '../../../domain/entity/mood.dart';
import '../../../domain/entity/profile.dart';
import '../../../domain/usecases/moods_usecase.dart';
import '../../../domain/usecases/profile_usecase.dart';
import '../../../enum/feel_enum.dart';
import '../../../routes/app_pages.dart';
import '../../../shared_ui/style/app_audios.dart';

class MoodController extends BaseController {
  final CarouselController controller = CarouselController();

  List<FeelEnum> feels = FeelEnum.values;

  final _profileUseCase = injector<ProfileUseCase>();
  final _moodsUseCase = injector<MoodsUseCase>();

  final profileState = const RequestState<Profile>.initial().obs;
  final moodsState = const RequestState<List<Mood>>.initial().obs;

  @override
  onInit() {
    super.onInit();
    getProfile();
    setAudio(AppAudios.authSong);
  }

  Future<void> getProfile() async {
    profileState.value = const RequestState<Profile>.loading();

    final result = await _profileUseCase.execute();
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        profileState.value = RequestState.error(errorMessage);
      },
      (data) {
        profileState.value = RequestState<Profile>.success(data);
        getMoods();
      },
    );
  }

  Future<void> getMoods() async {
    moodsState.value = const RequestState<List<Mood>>.loading();

    final result = await _moodsUseCase.execute();
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        moodsState.value = RequestState.error(errorMessage);
      },
      (data) => moodsState.value = RequestState<List<Mood>>.success(data),
    );
  }

  void showNextMood(Mood mood) => Get.toNamed(
        Routes.FIRST_MOOD,
        arguments: mood,
      );
}
