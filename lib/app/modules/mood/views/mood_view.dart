import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/common_error.dart';
import '../../../shared_ui/widgets/mood_selection.dart';
import '../../../utils/ui_helpers.dart';
import '../controllers/mood_controller.dart';

class MoodView extends GetView<MoodController> {
  const MoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: Obx(() {
          final profileState = controller.profileState.value;
          final moodsState = controller.moodsState.value;

          return profileState.when(
            initial: () => const SizedBox(),
            loading: () => showLoading,
            success: (profile) => Stack(
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
                  child: Column(
                    children: [
                      verticalSpace(64.0),
                      Image.asset(AppImages.logoTagLine),
                      verticalSpace(32.0),
                      Text(
                        '${LocaleKeys.hallo.tr} ${profile.name},\n ${LocaleKeys.howDoYouFeelToday.tr}',
                        style: blackSansitaRegularTextStyle.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: AppDimens.title,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      verticalSpace(16.0),
                      Expanded(
                        child: moodsState.when(
                          initial: () => const SizedBox(),
                          loading: () => showLoading,
                          success: (moods) => MoodSelection(
                            moods: moods,
                            onTap: (mood) => controller.showNextMood(mood),
                          ),
                          error: (error) => CommonError(
                            reload: () async => controller.getMoods(),
                            error: error,
                          ),
                        ),
                      ),
                      verticalSpace(16.0),
                    ],
                  ),
                ),
              ],
            ),
            error: (error) => CommonError(
              reload: () async => controller.getProfile(),
              error: error,
            ),
          );
        }),
      ),
    );
  }
}
