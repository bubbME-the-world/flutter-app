import 'package:bubbme/app/shared_ui/style/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../utils/ui_helpers.dart';
import '../../style/app_colors.dart';
import '../../style/app_dimens.dart';
import '../buttons/custom_button.dart';

class InformationDialog extends StatelessWidget {
  final String message;
  final Color? color;
  final Color? colorShadow;
  final String? buttonLabel;
  final VoidCallback? onTap;

  const InformationDialog({
    super.key,
    this.color,
    this.colorShadow,
    required this.message,
    this.buttonLabel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: Center(
        child: Container(
          width: screenWidth(context),
          decoration: BoxDecoration(
            color: color ?? AppColors.whiteBox,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: colorShadow ?? AppColors.whiteBoxShadow,
                offset: const Offset(0, 12),
                blurRadius: 0,
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  verticalSpace(24.0),
                  Text(
                    message,
                    style: blackBoldTextStyle.copyWith(
                      fontSize: AppDimens.title,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(32.0),
                  CustomButton(
                    onTap: onTap ?? () => Get.back,
                    position: 4.0.obs,
                    color: AppColors.primaryAccentSoft,
                    colorShadow: AppColors.primaryAccentShadow,
                    label: buttonLabel ?? LocaleKeys.close.tr,
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
