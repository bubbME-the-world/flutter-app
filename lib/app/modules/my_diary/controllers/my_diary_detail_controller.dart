import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bubbme/app/core/service/network_exceptions.dart';

import '../../../core/base_controller.dart';
import '../../../core/request_state.dart';
import '../../../data/model/requests/diary_mood_request.dart';
import '../../../data/model/requests/diary_request.dart';
import '../../../di/injectore.dart';
import '../../../domain/entity/diary.dart';
import '../../../domain/entity/mood.dart';
import '../../../domain/usecases/add_diary_mood_usecase.dart';
import '../../../domain/usecases/add_diary_usecase.dart';
import '../../../domain/usecases/diary_usecase.dart';
import '../../../domain/usecases/moods_usecase.dart';
import '../../../routes/app_pages.dart';
import '../../../shared_ui/widgets/dialogs/detail_mood_dialog.dart';
import '../../../shared_ui/widgets/dialogs/mood_dialog.dart';

class MyDiaryDetailController extends BaseController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController diaryController = TextEditingController();

  final _moodsUseCase = injector<MoodsUseCase>();
  final _diaryUseCase = injector<DiaryUseCase>();
  final _addDiaryUseCase = injector<AddDiaryUseCase>();
  final _addDiaryMoodUseCase = injector<AddDiaryMoodUseCase>();

  final moodsState = const RequestState<List<Mood>>.initial().obs;
  final diaryState = const RequestState<Diary>.initial().obs;
  final addDiaryState = const RequestState.initial().obs;
  final addDiaryMoodState = const RequestState.initial().obs;

  final isCreate = true.obs;
  String dateSelected = '';
  int? diaryId;

  final moodFirst = Rx<Mood?>(null);
  final moodSecond = Rx<Mood?>(null);
  final moodThird = Rx<Mood?>(null);

  @override
  void onInit() {
    super.onInit();
    _setArguments();
  }

  void _setArguments() {
    final List<dynamic> args = Get.arguments;
    isCreate.value = args[0] as bool;
    diaryId = args[1] as int?;
    dateSelected = args[2] as String;

    if (!isCreate.value) getDiary();
  }

  Future<void> getDiary() async {
    diaryState.value = const RequestState<Diary>.loading();

    final result = await _diaryUseCase.execute(diaryId!);
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        diaryState.value = RequestState.error(errorMessage);
      },
      (data) {
        diaryState.value = RequestState<Diary>.success(data);
        titleController.text = data.diaryTitle ?? '';
        diaryController.text = data.diaryDesc ?? '';
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
      (data) {
        moodsState.value = RequestState<List<Mood>>.success(data);
        showMoodDialog(data);
      },
    );
  }

  Future<void> validateFormAddDiary() async {
    if (formKey.currentState?.validate() ?? false) {
      addDiary();
    }
  }

  Future<void> addDiary() async {
    addDiaryState.value = const RequestState.loading();

    final request = DiaryRequest(
      diaryTitle: titleController.text,
      diaryDesc: diaryController.text,
      diaryDate: dateSelected,
    );
    final result = await _addDiaryUseCase.execute(request);
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        addDiaryState.value = RequestState.error(errorMessage);
      },
      (data) {
        addDiaryState.value = RequestState.success(data);
        isCreate.value = false;
        diaryId = data;
        getDiary();
      },
    );
  }

  Future<void> addDiaryMood() async {
    addDiaryMoodState.value = const RequestState.loading();

    final request = DiaryMoodRequest(
      moodId: moodFirst.value?.moodId,
      moodSecondId: moodSecond.value?.moodId,
      moodThirdId: moodThird.value?.moodId,
      diaryId: diaryId,
    );
    final result = await _addDiaryMoodUseCase.execute(request);
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        addDiaryMoodState.value = RequestState.error(errorMessage);
      },
      (data) {
        addDiaryMoodState.value = RequestState.success(data);
        getDiary();
      },
    );
  }

  void showMoodDialog(List<Mood> moods) => Get.dialog(
        MoodDialog(
          moods: moods,
          onTap: (mood) => showDetailMoodDialog(mood),
        ),
      );

  void showDetailMoodDialog(Mood mood) {
    Get.dialog(
      DetailMoodDialog(
        moodSelected: mood,
        moodFirst: (mood) => moodFirst.value = mood,
        moodSecond: (mood) => moodSecond.value = mood,
        moodThird: (mood) {
          moodThird.value = mood;
          addDiaryMood();
          Get.back();
        },
      ),
    );
  }

  void showMyWishList(Diary diary) => Get.toNamed(
        Routes.MY_WISH_LIST,
        arguments: diary,
      );

  void showMyPhobiaList(Diary diary) => Get.toNamed(
        Routes.MY_PHOBIA_LIST,
        arguments: diary,
      );
}
