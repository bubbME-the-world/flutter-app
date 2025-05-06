import 'package:flutter/material.dart';

import '../../../domain/entity/mood.dart';
import '../../../utils/ui_helpers.dart';
import '../../style/app_colors.dart';
import '../mood_selection.dart';

class MoodDialog extends StatelessWidget {
  final List<Mood> moods;
  final Function(Mood) onTap;

  const MoodDialog({
    super.key,
    required this.moods,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4.0,
      ),
      child: Center(
        child: Container(
          width: screenWidth(context),
          height: screenHeightPercentage(context, percentage: 0.7),
          decoration: BoxDecoration(
            color: AppColors.popupBackgroundBrown,
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [
              BoxShadow(
                color: AppColors.popupBackground,
                offset: Offset(0, 12),
                blurRadius: 0,
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Material(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MoodSelection(
                    moods: moods,
                    onTap: (mood) => onTap(mood),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
