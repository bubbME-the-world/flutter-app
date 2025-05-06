import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_images.dart';

class DiaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;

  const DiaryAppBar({
    super.key,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 8.0,
          ),
          child: IconButton(
            onPressed: () => Get.offAllNamed(Routes.HOME),
            icon: Image.asset(
              AppImages.iconBackHome,
              width: 32.0,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
