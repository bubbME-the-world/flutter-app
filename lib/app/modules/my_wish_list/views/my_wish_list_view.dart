import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/buttons/custom_button.dart';
import '../../../shared_ui/widgets/common_error.dart';
import '../../../utils/ui_helpers.dart';
import '../../my_diary/widgets/diary_app_bar.dart';
import '../controllers/my_wish_list_controller.dart';

class MyWishListView extends GetView<MyWishListController> {
  const MyWishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const DiaryAppBar(),
      body: Obx(() {
        final diaryState = controller.diaryState.value;
        final addDiaryWishListState = controller.addDiaryWishListState.value;
        final cards = controller.cards;

        return Container(
          width: screenWidth(context),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
            color: AppColors.primaryAccentSoft,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(24.0),
                Text(
                  LocaleKeys.myWishList.tr.toUpperCase(),
                  style: blackSansitaRegularTextStyle.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: AppDimens.title,
                    color: AppColors.primary,
                  ),
                ),
                verticalSpace(16.0),
                Expanded(
                  child: diaryState.when(
                    initial: () => const SizedBox(),
                    loading: () => showLoading,
                    success: (data) => ListView.builder(
                      itemCount: cards.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            cards[index],
                            if (index == cards.length - 1)
                              Column(
                                children: [
                                  verticalSpace(32.0),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () => controller.addWishList(null),
                                      child: Image.asset(
                                        AppImages.iconButtonAdd,
                                        width: 42.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        );
                      },
                    ),
                    error: (error) => CommonError(
                      reload: () async => controller.getDiary(),
                      error: error,
                    ),
                  ),
                ),
                verticalSpace(16.0),
                SafeArea(
                  child: Center(
                    child: addDiaryWishListState.when(
                      initial: () => CustomButton(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          controller.addDiaryWishList();
                        },
                        position: 4.0.obs,
                        color: AppColors.brown,
                        colorShadow: AppColors.brownShadow,
                        textColor: AppColors.white,
                        label: LocaleKeys.save.tr.toUpperCase(),
                      ),
                      loading: () => showLoading,
                      success: (data) => CustomButton(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          controller.addDiaryWishList();
                        },
                        position: 4.0.obs,
                        color: AppColors.brown,
                        colorShadow: AppColors.brownShadow,
                        textColor: AppColors.white,
                        label: LocaleKeys.save.tr.toUpperCase(),
                      ),
                      error: (error) => CommonError(
                        reload: () async => controller.getDiary(),
                        error: error,
                      ),
                    ),
                  ),
                ),
                verticalSpace(16.0),
              ],
            ),
          ),
        );
      }),
    );
  }
}
