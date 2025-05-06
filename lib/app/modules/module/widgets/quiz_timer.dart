import 'package:flutter/material.dart';

import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_strings.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../utils/ui_helpers.dart';

class QuizTimer extends StatelessWidget {
  final String time;

  const QuizTimer({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: screenWidth(context),
            height: screenHeightPercentage(context, percentage: .6),
            decoration: BoxDecoration(
              color: AppColors.brownModule,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [shadow],
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Material(
                color: Colors.transparent,
                child: Center(
                  child: Text(
                    time,
                    style: blackSansitaRegularTextStyle.copyWith(
                      fontSize: 160,
                      fontWeight: FontWeight.w900,
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Hero(
            tag: AppStrings.tagAnteenaGlasses,
            child: Image.asset(
              AppImages.glassesAnteena,
              fit: BoxFit.cover,
              height: screenHeightPercentage(
                context,
                percentage: .35,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
