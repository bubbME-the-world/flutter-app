import 'dart:async';

import 'package:bubbme/app/core/service/network_exceptions.dart';
import 'package:bubbme/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../constants/session.dart';
import '../../../core/base_controller.dart';
import '../../../di/injectore.dart';
import '../../../domain/entity/mood.dart';
import '../../../domain/usecases/mood_today_usecase.dart';

class SplashController extends BaseController {
  final _moodTodayUseCase = injector<MoodTodayUseCase>();

  late Timer _timer;
  final start = 0.obs;
  final int _end = 2000;

  List<Mood> moodToday = [];

  @override
  void onInit() {
    super.onInit();
    startSplash();
  }

  Future<void> startSplash() async {
    // await getMoodToday();
    const oneSec = Duration(milliseconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == _end) {
          checkLogin();
          _timer.cancel();
        } else {
          start.value++;
        }
      },
    );
  }

  Future<void> getMoodToday() async {
    final currentDate = DateTime.now();
    final date = '${currentDate.year}-${currentDate.month}-${currentDate.day}';

    final result = await _moodTodayUseCase.execute(date);
    result.fold(
      (e) => e.errorRes?.message ?? e.error?.stringError(),
      (data) => moodToday = data,
    );
  }

  void checkLogin() {
    if (box.read(Session.token) != null) {
      if (moodToday.isEmpty) {
        Get.offNamed(Routes.MOOD);
      } else {
        Get.offNamed(Routes.HOME);
      }
    } else {
      Get.offNamed(Routes.LANDING);
    }
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
