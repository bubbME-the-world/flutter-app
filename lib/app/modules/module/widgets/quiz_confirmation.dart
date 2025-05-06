import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/buttons/custom_button.dart';
import '../../../utils/ui_helpers.dart';

class QuizConfirmation extends StatelessWidget {
  final VoidCallback onGoTapped;
  final RxBool isChallenge;

  const QuizConfirmation({
    super.key,
    required this.onGoTapped,
    required this.isChallenge,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            AppImages.headGlassesAnteena2,
            fit: BoxFit.cover,
            height: screenHeightPercentage(
              context,
              percentage: .5,
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isChallenge.value)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImages.clock,
                          width: 38.0,
                        ),
                        horizontalSpace(16.0),
                        Text(
                          LocaleKeys.challenge.tr.toUpperCase(),
                          style: blackSansitaRegularTextStyle.copyWith(
                            fontSize: AppDimens.title,
                            fontWeight: FontWeight.w900,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(24.0)
                  ],
                ),
              Container(
                width: screenWidth(context),
                decoration: BoxDecoration(
                  color: AppColors.brownModule,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [shadow],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        verticalSpace(24.0),
                        Text(
                          LocaleKeys.areYouReady.tr.toUpperCase(),
                          style: blackSansitaRegularTextStyle.copyWith(
                            fontSize: AppDimens.title,
                            fontWeight: FontWeight.w900,
                            color: AppColors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        verticalSpace(32.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                              onTap: onGoTapped,
                              width: screenWidthPercentage(context,
                                  percentage: .3),
                              height: 40.0,
                              position: 4.0.obs,
                              color: AppColors.whiteBox,
                              colorShadow: AppColors.whiteBoxShadow,
                              textColor: AppColors.primary,
                              textSize: 16.0,
                              label: LocaleKeys.go.tr.toUpperCase(),
                            ),
                            CustomButton(
                              onTap: () => Get.back(),
                              width: screenWidthPercentage(context,
                                  percentage: .3),
                              height: 40.0,
                              position: 4.0.obs,
                              color: AppColors.whiteBox,
                              colorShadow: AppColors.whiteBoxShadow,
                              textColor: AppColors.primary,
                              textSize: 16.0,
                              label: LocaleKeys.later.tr.toUpperCase(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
