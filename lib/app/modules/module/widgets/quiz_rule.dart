import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/buttons/custom_button.dart';
import '../../../utils/ui_helpers.dart';

class QuizRule extends StatelessWidget {
  final VoidCallback onGoTapped;

  const QuizRule({
    super.key,
    required this.onGoTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
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
                      LocaleKeys.gameRules.tr.toUpperCase(),
                      style: blackSansitaRegularTextStyle.copyWith(
                        fontSize: AppDimens.title,
                        fontWeight: FontWeight.w900,
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    verticalSpace(48.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1. ${LocaleKeys.gameRulesOne.tr}',
                          style: blackSansitaRegularTextStyle.copyWith(
                            fontSize: AppDimens.body,
                            color: AppColors.white,
                          ),
                        ),
                        verticalSpace(AppDimens.spaceSmall),
                        Text(
                          '2. ${LocaleKeys.gameRulesTwo.tr}',
                          style: blackSansitaRegularTextStyle.copyWith(
                            fontSize: AppDimens.body,
                            color: AppColors.white,
                          ),
                        ),
                        verticalSpace(AppDimens.spaceSmall),
                        Text(
                          '3. ${LocaleKeys.gameRulesThree.tr}',
                          style: blackSansitaRegularTextStyle.copyWith(
                            fontSize: AppDimens.body,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(48.0),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                onTap: onGoTapped,
                width: screenWidthPercentage(
                  context,
                  percentage: .30,
                ),
                height: 40.0,
                position: 4.0.obs,
                color: AppColors.whiteBox,
                colorShadow: AppColors.whiteBoxShadow,
                textColor: AppColors.primary,
                textSize: 16.0,
                label: LocaleKeys.letsGo.tr.toUpperCase(),
              ),
              Image.asset(
                AppImages.glassesAnteena,
                fit: BoxFit.cover,
                height: screenHeightPercentage(
                  context,
                  percentage: .30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
