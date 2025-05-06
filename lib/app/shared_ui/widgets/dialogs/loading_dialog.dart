import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style/app_colors.dart';
import '../../style/app_dimens.dart';
import '../../style/app_styles.dart';

class LoadingDialog extends GetView {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimens.radius),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: showLoading,
        ),
      ),
    );
  }
}
