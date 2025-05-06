import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../domain/entity/mood.dart';
import '../../utils/ui_helpers.dart';
import '../style/app_colors.dart';
import 'buttons/custom_button.dart';

class MoodSelection extends StatelessWidget {
  final List<Mood> moods;
  final Function(Mood) onTap;

  const MoodSelection({
    super.key,
    required this.moods,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
      ),
      padding: EdgeInsets.zero,
      itemCount: moods.length,
      itemBuilder: (context, index) {
        final mood = moods[index];
        final moodColor = mood.moodColor == '' || mood.moodColor!.isEmpty
            ? '#97B581'
            : mood.moodColor;
        final colorString = moodColor?.replaceAll('#', '0xFF');
        final color = Color(int.parse(colorString!));
        return Center(
          child: CustomButton(
            onTap: () => onTap(mood),
            height: screenWidthPercentage(context, percentage: .25),
            width: screenWidthPercentage(context, percentage: .25),
            radius: screenWidthPercentage(context, percentage: .25) / 2,
            position: 4.0.obs,
            color: color,
            colorShadow: AppColors.black.withOpacity(.5),
            label: mood.moodCaption ?? '',
          ),
        );
      },
    );
  }
}
