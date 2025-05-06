import 'package:bubbme/app/extensions/string_ext.dart';
import 'package:get/get.dart';
import 'package:bubbme/app/core/service/network_exceptions.dart';

import '../../../core/base_controller.dart';
import '../../../core/request_state.dart';
import '../../../di/injectore.dart';
import '../../../domain/entity/diary.dart';
import '../../../domain/usecases/diaries_usecase.dart';
import '../../../routes/app_pages.dart';

class MyDiaryController extends BaseController {
  final _diariesUseCase = injector<DiariesUseCase>();

  final diariesState = const RequestState<List<Diary>>.initial().obs;

  final dateLabelSelected = "".obs;
  final dateTitleSelected = "".obs;
  final dateSelected = DateTime.now().obs;

  @override
  onInit() {
    super.onInit();
    setDateSelected(DateTime.now());
  }

  void setDateSelected(DateTime date) {
    dateLabelSelected.value = '${date.year}-${date.month}-${date.day}';
    dateSelected.value = date;
    dateTitleSelected.value = date.toString().formatTime();

    getDiaries();
  }

  Future<void> getDiaries() async {
    diariesState.value = const RequestState<List<Diary>>.loading();

    final result = await _diariesUseCase.execute(date: dateLabelSelected.value);
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        diariesState.value = RequestState.error(errorMessage);
      },
      (data) => diariesState.value = RequestState<List<Diary>>.success(data),
    );
  }

  showMyDiaryDetail({
    required bool isCreate,
    int? id,
  }) =>
      Get.toNamed(
        Routes.MY_DIARY_DETAIL,
        arguments: [
          isCreate,
          id,
          dateLabelSelected.value,
        ],
      )?.then((value) {
        if (isCreate) getDiaries();
      });
}
