import 'package:bubbme/app/core/service/network_exceptions.dart';
import 'package:get/get.dart';

import '../../../core/base_controller.dart';
import '../../../core/request_state.dart';
import '../../../data/model/requests/mood_request.dart';
import '../../../di/injectore.dart';
import '../../../domain/entity/mood.dart';
import '../../../domain/usecases/add_mood_usecase.dart';
import '../../../routes/app_pages.dart';
import '../../../shared_ui/style/app_audios.dart';
import '../../../shared_ui/widgets/dialogs/my_mood_dialog.dart';

class FirstMoodController extends BaseController {
  final _addMoodUseCase = injector<AddMoodUseCase>();

  final addMoodState = const RequestState.initial().obs;

  final moodSelected = Rx<Mood?>(null);
  final moodFirst = Rx<Mood?>(null);
  final moodSecond = Rx<Mood?>(null);
  final moodThird = Rx<Mood?>(null);

  @override
  void onInit() {
    super.onInit();
    moodSelected.value = Get.arguments as Mood;
    moodFirst.value = moodSelected.value;
    getProfileLocal();
    if (player == null) {
      setAudio(AppAudios.authSong);
    }
  }

  void moodDetailSelected(Mood mood) {
    if (mood.data?.isEmpty ?? true) {
      showMoodSelectedDialog(mood);
      moodThird.value = mood;
    } else {
      moodSelected.value = mood;
      moodSecond.value = moodSelected.value;
      update();
    }
  }

  void showMoodSelectedDialog(Mood mood) {
    Get.dialog(
      MyMoodDialog(
        moodSelected: mood,
        onSaveTapped: () {
          Get.back();
          addMood(mood);
        },
      ),
    );
  }

  Future<void> addMood(Mood mood) async {
    addMoodState.value = const RequestState.loading();

    final request = MoodRequest(
      moodId: moodFirst.value?.moodId,
      moodSecondId: moodSecond.value?.moodId,
      moodThirdId: moodThird.value?.moodId,
    );
    final result = await _addMoodUseCase.execute(request);
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        addMoodState.value = RequestState.error(errorMessage);
      },
      (data) {
        addMoodState.value = RequestState.success(data);
        showResultMood(mood);
      },
    );
  }

  void showResultMood(Mood mood) =>
      Get.offAllNamed(Routes.RESULT_MOOD, arguments: mood);
}
