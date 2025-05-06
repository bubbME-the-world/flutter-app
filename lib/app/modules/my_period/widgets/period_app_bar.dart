import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';

class PeriodAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final String? title;
  final String? name;

  const PeriodAppBar({
    super.key,
    this.backgroundColor,
    this.title,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.white,
      title: Text(
        title ?? 'HELLO $name',
        style: blackSansitaRegularTextStyle.copyWith(
          fontSize: AppDimens.title,
          fontWeight: FontWeight.w800,
          color: AppColors.primary,
        ),
      ),
      centerTitle: true,
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
