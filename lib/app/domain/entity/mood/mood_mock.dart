import 'package:flutter/material.dart';

import '../../../shared_ui/style/app_colors.dart';

@immutable
class MoodMock {
  final String name;
  final Color color;

  const MoodMock({
    required this.name,
    required this.color,
  });
}

const joyMood = [
  MoodMock(name: 'Happy', color: AppColors.happy),
  MoodMock(name: 'Proud', color: AppColors.proud),
  MoodMock(name: 'Optimistic', color: AppColors.optimistic),
  MoodMock(name: 'Content', color: AppColors.content),
  MoodMock(name: 'Cheerful', color: AppColors.cheerful),
  MoodMock(name: 'Elation', color: AppColors.elation),
  MoodMock(name: 'Enthusiastic', color: AppColors.enthusiastic),
  MoodMock(name: 'Enthralled', color: AppColors.enthralled),
];

const loveMood = [
  MoodMock(name: 'Affectionate', color: AppColors.affectionate),
  MoodMock(name: 'Longing', color: AppColors.longing),
  MoodMock(name: 'Desire', color: AppColors.desire),
  MoodMock(name: 'Tenderness', color: AppColors.tenderness),
  MoodMock(name: 'Peaceful', color: AppColors.peaceful),
];

const surpriseMood = [
  MoodMock(name: 'Moved', color: AppColors.moved),
  MoodMock(name: 'Stunned', color: AppColors.stunned),
  MoodMock(name: 'Amazed', color: AppColors.amazed),
  MoodMock(name: 'Overcome', color: AppColors.overcome),
  MoodMock(name: 'Confused', color: AppColors.confused),
];

const fearMood = [
  MoodMock(name: 'Scared', color: AppColors.scared),
  MoodMock(name: 'Terror', color: AppColors.terror),
  MoodMock(name: 'Insecure', color: AppColors.insecure),
  MoodMock(name: 'Nervous', color: AppColors.nervous),
  MoodMock(name: 'Horror', color: AppColors.horror),
];

const angerMood = [
  MoodMock(name: 'Rage', color: AppColors.rage),
  MoodMock(name: 'Envy', color: AppColors.envy),
  MoodMock(name: 'Disgust', color: AppColors.disgust),
  MoodMock(name: 'Exasperated', color: AppColors.exasperated),
  MoodMock(name: 'Irritable', color: AppColors.irritable),
];

const sadnessMood = [
  MoodMock(name: 'Despair', color: AppColors.despair),
  MoodMock(name: 'Neglected', color: AppColors.neglected),
  MoodMock(name: 'Shameful', color: AppColors.shameful),
  MoodMock(name: 'Disappointed', color: AppColors.disappointed),
  MoodMock(name: 'Sadness', color: AppColors.sadness),
  MoodMock(name: 'Suffering', color: AppColors.suffering),
];
