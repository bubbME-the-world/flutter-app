import 'package:flutter/material.dart';

import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_styles.dart';

class CardRecordPeriod extends StatelessWidget {
  final String recordLabel;

  const CardRecordPeriod({
    super.key,
    required this.recordLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      color: AppColors.white,
      child: ListTile(
        title: Text(
          recordLabel.toUpperCase(),
          style: primaryBoldTextStyle,
        ),
        trailing: Transform.rotate(
          angle: 3.14 / 2,
          child: const Icon(
            Icons.arrow_forward_ios,
            size: 16.0,
            color: AppColors.primaryAccent,
          ),
        ),
      ),
    );
  }
}
