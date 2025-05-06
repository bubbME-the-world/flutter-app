import 'package:flutter/material.dart';

import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/widgets/icon_setting.dart';

class MenuModule extends StatelessWidget {
  final VoidCallback onHomeTapped;
  final VoidCallback onSettingTapped;

  const MenuModule({
    super.key,
    required this.onHomeTapped,
    required this.onSettingTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 8.0,
      top: 8.0,
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              onPressed: onHomeTapped,
              icon: Image.asset(
                AppImages.iconBackHome,
                width: 32.0,
              ),
            ),
            GestureDetector(
              onTap: onSettingTapped,
              child: IconSetting(),
            ),
          ],
        ),
      ),
    );
  }
}
