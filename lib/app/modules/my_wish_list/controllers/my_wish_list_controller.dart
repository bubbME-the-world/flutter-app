import 'package:bubbme/app/core/service/network_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/base_controller.dart';
import '../../../core/request_state.dart';
import '../../../data/model/requests/diary_wish_list_desc_request.dart';
import '../../../data/model/requests/diary_wish_list_request.dart';
import '../../../di/injectore.dart';
import '../../../domain/entity/diary.dart';
import '../../../domain/usecases/add_diary_wish_list_usecase.dart';
import '../../../domain/usecases/diary_usecase.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/widgets/textfield.dart';

class MyWishListController extends BaseController {
  final _diaryUseCase = injector<DiaryUseCase>();
  final _addDiaryWishListUseCase = injector<AddDiaryWishListUseCase>();

  final diaryState = const RequestState<Diary>.initial().obs;
  final addDiaryWishListState = const RequestState.initial().obs;

  final wishlistControllers = <TextEditingController>[].obs;
  final cards = <Card>[].obs;
  Diary? diary;

  @override
  void onInit() {
    super.onInit();
    diary = Get.arguments as Diary?;
    getDiary();
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
        _setupWishList();
      },
    );
  }

  void _setupWishList() {
    if (diary?.diaryWishList?.isEmpty ?? true) {
      addWishList(null);
    } else {
      diary?.diaryWishList?.forEach((wishList) {
        addWishList(wishList.diaryWishListDesc);
      });
    }
  }

  void addWishList(String? wishList) {
    final controller = TextEditingController();
    controller.text = wishList ?? '';
    wishlistControllers.add(controller);
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
              final index = wishlistControllers.indexOf(controller);
              removeWishList(index);
            },
          ),
        ],
      ),
    );
    cards.add(card);
  }

  void removeWishList(int index) {
    wishlistControllers.removeAt(index);
    cards.removeAt(index);
  }

  Future<void> addDiaryWishList() async {
    addDiaryWishListState.value = const RequestState.loading();

    final request = DiaryWishListRequest(
      diaryId: diary?.diaryId,
      data: wishlistControllers
          .map((e) => e.text)
          .where((element) => element.isNotEmpty)
          .map((e) => DiaryWishListDescRequest(diaryWishListDesc: e))
          .toList(),
    );
    final result = await _addDiaryWishListUseCase.execute(request);
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        addDiaryWishListState.value = RequestState.error(errorMessage);
      },
      (data) {
        addDiaryWishListState.value = RequestState.success(data);
        wishlistControllers.clear();
        cards.clear();
        getDiary();
      },
    );
  }
}
