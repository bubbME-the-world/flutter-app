import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../domain/entity/mood.dart';
import '../../../utils/ui_helpers.dart';
import '../../style/app_colors.dart';
import '../detail_mood_selection.dart';

class DetailMoodDialog extends StatefulWidget {
  final Mood moodSelected;
  final Function(Mood) moodFirst;
  final Function(Mood) moodSecond;
  final Function(Mood) moodThird;

  const DetailMoodDialog({
    super.key,
    required this.moodSelected,
    required this.moodFirst,
    required this.moodSecond,
    required this.moodThird,
  });

  @override
  State<DetailMoodDialog> createState() => _DetailMoodDialogState();
}

class _DetailMoodDialogState extends State<DetailMoodDialog> {
  final moodSelected = Rx<Mood?>(null);
  final moodFirst = Rx<Mood?>(null);
  final moodSecond = Rx<Mood?>(null);
  final moodThird = Rx<Mood?>(null);

  @override
  void initState() {
    super.initState();
    moodSelected.value = widget.moodSelected;
    moodFirst.value = moodSelected.value;
    widget.moodFirst(moodFirst.value!);
  }

  void moodDetailSelected(Mood mood) {
    if (mood.data?.isEmpty ?? true) {
      setState(() {
        moodThird.value = mood;
        widget.moodThird(mood);
      });
      Get.back();
    } else {
      setState(() {
        moodSelected.value = mood;
        moodSecond.value = moodSelected.value;
        widget.moodSecond(mood);
      });
    }
  }

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
                  DetailMoodSelection(
                    moodSelected: moodSelected.value,
                    onTap: (mood) => moodDetailSelected(mood),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
