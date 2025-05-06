import 'package:flutter/material.dart';

import '../shared_ui/style/app_colors.dart';

enum FeelEnum {
  joy,
  love,
  surprise,
  fear,
  anger,
  sadness;

  String get displayTitle {
    switch (this) {
      case FeelEnum.joy:
        return 'Joy';
      case FeelEnum.love:
        return 'Love';
      case FeelEnum.surprise:
        return 'Surprise';
      case FeelEnum.fear:
        return 'Fear';
      case FeelEnum.anger:
        return 'Anger';
      case FeelEnum.sadness:
        return 'Sadness';
      }
  }

  Color get displayColor {
    switch (this) {
      case FeelEnum.joy:
        return AppColors.joy;
      case FeelEnum.love:
        return AppColors.love;
      case FeelEnum.surprise:
        return AppColors.surprise;
      case FeelEnum.fear:
        return AppColors.fear;
      case FeelEnum.anger:
        return AppColors.anger;
      case FeelEnum.sadness:
        return AppColors.sadness;
      }
  }
}
