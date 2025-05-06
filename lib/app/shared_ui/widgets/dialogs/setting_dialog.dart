import 'package:bubbme/app/shared_ui/style/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../utils/ui_helpers.dart';
import '../../style/app_colors.dart';

class SettingDialog extends StatelessWidget {
  final double volume;
  final Function(double) onVolumeChanged;

  const SettingDialog({
    super.key,
    required this.volume,
    required this.onVolumeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Center(
          child: Container(
            width: screenWidth(context),
            decoration: BoxDecoration(
              color: AppColors.brown,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: AppColors.brownShadow,
                  offset: const Offset(0, 12),
                  blurRadius: 0,
                  spreadRadius: 0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppImages.iconVolume,
                          width: 24.0,
                        ),
                        horizontalSpace(16.0),
                        Flexible(
                          child: Slider(
                            min: 0,
                            max: 1,
                            onChanged: onVolumeChanged,
                            value: volume,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
