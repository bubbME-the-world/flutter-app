import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_strings.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/common_error.dart';
import '../../../utils/ui_helpers.dart';
import '../controllers/module_controller.dart';
import '../widgets/item_module.dart';
import '../widgets/menu_module.dart';

class ModuleView extends GetView<ModuleController> {
  const ModuleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryAccentSoft,
      body: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Hero(
                tag: AppStrings.tagHalfGlobe,
                child: Image.asset(AppImages.halfGlobe),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Obx(
                    () {
                      final modulesState = controller.modulesState.value;

                      return modulesState.when(
                        initial: () => const SizedBox(),
                        loading: () => showLoading,
                        success: (modules) => GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16.0,
                            crossAxisSpacing: 16.0,
                            childAspectRatio: 1.05,
                          ),
                          padding: EdgeInsets.zero,
                          itemCount: modules.length,
                          itemBuilder: (context, index) {
                            final module = modules[index];

                            return ItemModule(
                              module: module,
                              onGoTapped: () =>
                                  controller.showLevel(module.moduleId!),
                            );
                          },
                        ),
                        error: (error) => CommonError(
                          reload: () async => controller.getModules(),
                          error: error,
                        ),
                      );
                    },
                  ),
                ),
                verticalSpace(132.0)
              ],
            ),
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
