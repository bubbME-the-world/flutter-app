import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../domain/entity/mood.dart';
import '../../utils/ui_helpers.dart';
import '../style/app_colors.dart';
import 'buttons/custom_button.dart';

class DetailMoodSelection extends StatelessWidget {
  final Mood? moodSelected;
  final Function(Mood) onTap;

  const DetailMoodSelection({
    super.key,
    this.moodSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
      ),
      padding: EdgeInsets.zero,
      itemCount: moodSelected?.data?.length,
      itemBuilder: (context, index) {
        final mood = moodSelected?.data?[index];
        final moodColor =
            mood?.moodColor == '' || mood?.moodColor?.isEmpty == true
                ? '#97B581'
                : mood?.moodColor;
        final colorString = moodColor?.replaceAll('#', '0xFF');
        final color = Color(int.parse(colorString!));
        return Center(
          child: CustomButton(
            onTap: () => onTap(mood!),
            height: screenWidthPercentage(
              context,
              percentage: .25,
            ),
            width: screenWidthPercentage(
              context,
              percentage: .40,
            ),
            radius: 18.0,
            position: 4.0.obs,
            color: color,
            colorShadow: AppColors.black.withOpacity(.5),
            label: (mood?.moodCaption ?? '').toUpperCase(),
          ),
        );
      },
    );
  }
}
