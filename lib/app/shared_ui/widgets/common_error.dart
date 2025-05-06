import 'package:flutter/material.dart';

import '../../utils/ui_helpers.dart';
import '../style/app_colors.dart';
import '../style/app_dimens.dart';
import '../style/app_styles.dart';

class CommonError extends StatelessWidget {
  final String? error;
  final VoidCallback reload;

  const CommonError({
    super.key,
    this.error,
    required this.reload,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.warning,
            color: AppColors.red,
            size: 64.0,
          ),
          verticalSpace(16.0),
          Text(
            error ?? "",
            style: blackBoldTextStyle.copyWith(
              fontSize: AppDimens.title,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpace(16.0),
          ElevatedButton(
            onPressed: reload,
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.grey),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Reload", style: whiteRegularTextStyle),
                horizontalSpace(8.0),
                const Icon(Icons.refresh, color: Colors.white)
              ],
            ),
          )
        ],
      ),
    );
  }
}
