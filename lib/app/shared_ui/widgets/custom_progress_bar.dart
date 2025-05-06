import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../style/app_colors.dart';

class CustomProgressBar extends StatelessWidget {
  final int currentStep;

  const CustomProgressBar({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppColors.primary,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: StepProgressIndicator(
        totalSteps: 20,
        currentStep: currentStep ~/ 100,
        size: 20,
        selectedColor: AppColors.primary,
        unselectedColor: Colors.transparent,
        roundedEdges: const Radius.circular(10),
      ),
    );
  }
}
