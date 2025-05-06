import 'package:bubbme/app/utils/ui_helpers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_strings.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/common_error.dart';
import '../controllers/module_level_controller.dart';
import '../widgets/item_module_level.dart';
import '../widgets/menu_module.dart';

class ModuleLevelView extends GetView<ModuleLevelController> {
  const ModuleLevelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryAccentSoft,
      body: Stack(
        children: [
          Column(
            children: [
              SafeArea(
                child: Hero(
                  tag: AppStrings.tagAnteenaUfo,
                  child: Image.asset(
                    AppImages.anteenaUfo,
                    width: 160.0,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Obx(() {
                    final levelsState = controller.nodesState.value;

                    return levelsState.when(
                      initial: () => const SizedBox(),
                      loading: () => showLoading,
                      success: (levels) => RawScrollbar(
                        thumbColor: AppColors.primary,
                        trackColor: AppColors.white,
                        radius: const Radius.circular(6.0),
                        thickness: 12.0,
                        thumbVisibility: true,
                        padding: EdgeInsets.zero,
                        scrollbarOrientation: ScrollbarOrientation.left,
                        controller: controller.scrollController,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ListView.builder(
                            controller: controller.scrollController,
                            itemCount: levels.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (BuildContext context, int index) {
                              final level = levels[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ItemModuleLevel(
                                  level: level,
                                  onStartTapped: () =>
                                      controller.showLoading(level),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      error: (error) => CommonError(
                        reload: () async => controller.getLevels(),
                        error: error,
                      ),
                    );
                  }),
                ),
              ),
              verticalSpace(16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Hero(
                  tag: AppStrings.tagHalfGlobe,
                  child: Image.asset(AppImages.halfGlobe),
                ),
              ),
            ],
          ),
          MenuModule(
            onHomeTapped: () => controller.showHome(),
            onSettingTapped: () => controller.showSettingDialog(),
          ),
        ],
      ),
    );
  }
}
