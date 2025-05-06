import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/buttons/custom_button.dart';
import '../../../shared_ui/widgets/common_error.dart';
import '../../../shared_ui/widgets/textfield.dart';
import '../../../utils/ui_helpers.dart';
import '../../../utils/validator/validator.dart';
import '../controllers/my_diary_detail_controller.dart';
import '../widgets/diary_app_bar.dart';

class MyDiaryDetailView extends GetView<MyDiaryDetailController> {
  const MyDiaryDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const DiaryAppBar(),
      body: Container(
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
                LocaleKeys.dearDiary.tr.toUpperCase(),
                style: blackSansitaRegularTextStyle.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: AppDimens.title,
                  color: AppColors.primary,
                ),
              ),
              verticalSpace(24.0),
              Expanded(
                child: SingleChildScrollView(
                  child:
                    Form(
                      key: controller.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        children: [
                          KTextField(
                            isDense: true,
                            maxLines: 1,
                            borderRadius: AppDimens.radiusTextField,
                            controller: controller.titleController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            backgroundColor: AppColors.white,
                            placeholder: LocaleKeys.hintWriteTitle.tr,
                            validator: Validator.requiredValidator.call,
                          ),
                          verticalSpace(16.0),
                          KTextField(
                            isDense: true,
                            maxLines: 10,
                            minLines: 8,
                            borderRadius: AppDimens.radiusTextField,
                            controller: controller.diaryController,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            backgroundColor: AppColors.white,
                            placeholder: LocaleKeys.hintWriteDiary.tr,
                            validator: Validator.requiredValidator.call,
                          ),
                        ],
                      ),
                    ),

                ),
              ),
              verticalSpace(24.0),
              Obx(() {
                final addDiaryState = controller.addDiaryState.value;
                final diaryState = controller.diaryState.value;

                return controller.isCreate.value
                    ? Center(
                        child: SizedBox(
                          width: 40.0,
                          height: 40.0,
                          child: addDiaryState.when(
                            initial: () => GestureDetector(
                              onTap: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                controller.validateFormAddDiary();
                              },
                              child: Image.asset(
                                AppImages.iconButtonAdd,
                                width: 32.0,
                              ),
                            ),
                            loading: () => showLoading,
                            success: (data) => const SizedBox(),
                            error: (error) => GestureDetector(
                              onTap: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                controller.validateFormAddDiary();
                              },
                              child: Image.asset(
                                AppImages.iconButtonAdd,
                                width: 32.0,
                              ),
                            ),
                          ),
                        ),
                      )
                    : diaryState.when(
                        initial: () => const SizedBox(),
                        loading: () => showLoading,
                        success: (data) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                  onTap: () => controller.getMoods(),
                                  width: screenWidthPercentage(context,
                                      percentage: 0.4),
                                  height: 68.0,
                                  position: 4.0.obs,
                                  color: AppColors.whiteBox,
                                  colorShadow: AppColors.whiteBoxShadow,
                                  label: data.diaryMood?.moodThirdCaption == ''
                                      ? LocaleKeys.myMoodDiary.tr.toUpperCase()
                                      : data.diaryMood?.moodThirdCaption ?? '',
                                  textColor: AppColors.primary,
                                ),
                                SizedBox(
                                  width: screenWidthPercentage(context,
                                      percentage: 0.4),
                                  height: 40.0,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      AppImages.iconButtonAdd,
                                      width: 32.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            verticalSpace(32.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                  onTap: () => controller.showMyWishList(data),
                                  width: screenWidthPercentage(context,
                                      percentage: 0.4),
                                  height: 68.0,
                                  position: 4.0.obs,
                                  color: AppColors.brown,
                                  colorShadow: AppColors.brownShadow,
                                  label: LocaleKeys.myWishList.tr.toUpperCase(),
                                  textColor: AppColors.white,
                                ),
                                CustomButton(
                                  onTap: () =>
                                      controller.showMyPhobiaList(data),
                                  width: screenWidthPercentage(context,
                                      percentage: 0.4),
                                  position: 4.0.obs,
                                  height: 68.0,
                                  color: AppColors.brown,
                                  colorShadow: AppColors.brownShadow,
                                  label:
                                      LocaleKeys.myPhobiaList.tr.toUpperCase(),
                                  textColor: AppColors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                        error: (error) => CommonError(
                          reload: () async => controller.getDiary(),
                          error: error,
                        ),
                      );
              }),
              verticalSpace(24.0),
            ],
          ),
        ),
      ),
    );
  }
}
