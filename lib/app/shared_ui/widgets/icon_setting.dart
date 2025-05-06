import 'package:flutter/material.dart';

import '../style/app_images.dart';

class IconSetting extends StatelessWidget {
  const IconSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.iconSetting,
      width: 40,
    );
  }
}
