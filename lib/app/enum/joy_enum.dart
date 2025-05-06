import 'package:flutter/material.dart';

import '../shared_ui/style/app_colors.dart';

enum JoyEnum {
  happy,
  proud,
  optimistic,
  content,
  cheerful,
  elation,
  enthusiastic,
  enthralled,
}

extension StyleExtension on JoyEnum {
  String get displayTitle {
    switch (this) {
      case JoyEnum.happy:
        return 'Happy';
      case JoyEnum.proud:
        return 'Proud';
      case JoyEnum.optimistic:
        return 'Optimistic';
      case JoyEnum.content:
        return 'Content';
      case JoyEnum.cheerful:
        return 'Cheerful';
      case JoyEnum.elation:
        return 'Elation';
      case JoyEnum.enthusiastic:
        return 'Enthusiastic';
      case JoyEnum.enthralled:
        return 'Enthralled';
      }
  }

  Color get displayColor {
    switch (this) {
      case JoyEnum.happy:
        return AppColors.happy;
      case JoyEnum.proud:
        return AppColors.proud;
      case JoyEnum.optimistic:
        return AppColors.optimistic;
      case JoyEnum.content:
        return AppColors.content;
      case JoyEnum.cheerful:
        return AppColors.cheerful;
      case JoyEnum.elation:
        return AppColors.elation;
      case JoyEnum.enthusiastic:
        return AppColors.enthusiastic;
      case JoyEnum.enthralled:
        return AppColors.enthralled;
      }
  }
}
