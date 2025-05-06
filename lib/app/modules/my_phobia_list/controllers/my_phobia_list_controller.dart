import 'package:bubbme/app/domain/entity/diary_phobia_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bubbme/app/core/service/network_exceptions.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/request_state.dart';
import '../../../data/model/requests/diary_phobia_list_desc_request.dart';
import '../../../data/model/requests/diary_phobia_list_request.dart';
import '../../../di/injectore.dart';
import '../../../domain/entity/diary.dart';
import '../../../domain/usecases/add_diary_phobia_list_usecase.dart';
import '../../../domain/usecases/diary_phobia_usecase.dart';
import '../../../domain/usecases/diary_usecase.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/widgets/textfield.dart';

class MyPhobiaListController extends GetxController {
  final _diaryUseCase = injector<DiaryUseCase>();
  final _diaryPhobiaUseCase = injector<DiaryPhobiaUseCase>();
  final _addDiaryPhobiaListUseCase = injector<AddDiaryPhobiaListUseCase>();

  final diaryState = const RequestState<Diary>.initial().obs;
  final diaryPhobiaState =
      const RequestState<List<DiaryPhobiaList>>.initial().obs;
  final addDiaryPhobiaListState = const RequestState.initial().obs;

  final phobiaListControllers = <TextEditingController>[].obs;
  final cards = <Card>[].obs;
  Diary? diary;
  List<DiaryPhobiaList>? diaryPhobia;

  @override
  void onInit() {
    super.onInit();
    diary = Get.arguments as Diary?;
    // getDiary();
    getDiaryPhobia();
  }

  Future<void> getDiary() async {
    diaryState.value = const RequestState<Diary>.loading();

    final result = await _diaryUseCase.execute(diary?.diaryId ?? 0);
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        diaryState.value = RequestState.error(errorMessage);
      },
      (data) {
        diaryState.value = RequestState<Diary>.success(data);
        diary = data;
      },
    );
  }

  Future<void> getDiaryPhobia() async {
    diaryPhobiaState.value =
        const RequestState<List<DiaryPhobiaList>>.loading();

    final result = await _diaryPhobiaUseCase.execute(diary?.diaryId ?? 0);
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        diaryPhobiaState.value = RequestState.error(errorMessage);
      },
      (data) {
        diaryPhobiaState.value =
            RequestState<List<DiaryPhobiaList>>.success(data);
        diaryPhobia = data;
        _setupPhobiaList();
      },
    );
  }

  void _setupPhobiaList() {
    if (diaryPhobia?.isEmpty ?? true) {
      addPhobiaList(null);
    } else {
      diaryPhobia?.forEach((phobiaList) {
        addPhobiaList(phobiaList.diaryPhobiaListDesc);
      });
    }
  }

  void addPhobiaList(String? wishList) {
    final controller = TextEditingController();
    controller.text = wishList ?? '';
    phobiaListControllers.add(controller);
    final card = Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.radiusTextField),
      ),
      child: Row(
        children: [
          Expanded(
            child: KTextField(
              isDense: true,
              maxLines: 1,
              borderRadius: AppDimens.radiusTextField,
              controller: controller,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              backgroundColor: AppColors.white,
              placeholder: LocaleKeys.writeYourList.tr,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              final index = phobiaListControllers.indexOf(controller);
              removePhobiaList(index);
            },
          ),
        ],
      ),
    );
    cards.add(card);
  }

  void removePhobiaList(int index) {
    phobiaListControllers.removeAt(index);
    cards.removeAt(index);
  }

  Future<void> addDiaryPhobiaList() async {
    addDiaryPhobiaListState.value = const RequestState.loading();

    final request = DiaryPhobiaListRequest(
      diaryId: diary?.diaryId,
      data: phobiaListControllers
          .map((e) => e.text)
          .where((element) => element.isNotEmpty)
          .map((e) => DiaryPhobiaListDescRequest(diaryPhobiaListDesc: e))
          .toList(),
    );
    final result = await _addDiaryPhobiaListUseCase.execute(request);
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        addDiaryPhobiaListState.value = RequestState.error(errorMessage);
      },
      (data) {
        addDiaryPhobiaListState.value = RequestState.success(data);
        phobiaListControllers.clear();
        cards.clear();
        getDiaryPhobia();
      },
    );
  }
}
