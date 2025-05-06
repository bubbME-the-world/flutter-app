import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/common_error.dart';
import '../../../shared_ui/widgets/detail_mood_selection.dart';
import '../../../utils/ui_helpers.dart';
import '../controllers/first_mood_controller.dart';

class FirstMoodView extends GetView<FirstMoodController> {
  const FirstMoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: Stack(
          children: [
            Positioned(
              bottom: 0.0,
              child: Image.asset(
                AppImages.headAnteena2,
                width: screenWidth(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Obx(() {
                final moodSelected = controller.moodSelected.value;
                return Column(
                  children: [
                    verticalSpace(64.0),
                    Image.asset(AppImages.logoTagLine),
                    verticalSpace(32.0),
                    Text(
                      '${controller.profileLocal.name},\n ${LocaleKeys.chooseMoodDesc.tr} ${moodSelected?.moodCaption ?? ''} ${LocaleKeys.below.tr}',
                      style: blackSansitaRegularTextStyle.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: AppDimens.title,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    verticalSpace(16.0),
                    Obx(() {
                      final addMoodState = controller.addMoodState.value;

                      return Expanded(
                        child: addMoodState.when(
                          initial: () => DetailMoodSelection(
                            moodSelected: moodSelected,
                            onTap: (mood) =>
                                controller.moodDetailSelected(mood),
                          ),
                          loading: () => showLoading,
                          success: (data) => const SizedBox(),
                          error: (error) => CommonError(
                            reload: () async =>
                                controller.addMood(controller.moodThird.value!),
                            error: error,
                          ),
                        ),
                      );
                    }),
                    verticalSpace(16.0),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
