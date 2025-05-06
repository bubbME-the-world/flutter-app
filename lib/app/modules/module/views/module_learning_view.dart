import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_strings.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../utils/ui_helpers.dart';
import '../controllers/module_learning_controller.dart';
import '../widgets/menu_module.dart';

class ModuleLearningView extends GetView<ModuleLearningController> {
  const ModuleLearningView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final slideDesc = controller.boardSlides
            .value?[controller.indexSlide.value].board?.first.moduleQuestion;
        final narrativeSlide = controller
            .boardSlides.value?[controller.indexSlide.value].narrative;
        final narrativeDesc = narrativeSlide?.first.listMultipleChoice
            ?.elementAt(controller.indexNarrative.value)
            .answer;

        return Stack(
          children: [
            Image.asset(
              AppImages.moduleBackground,
              fit: BoxFit.fill,
              height: screenHeight(context),
              width: screenWidth(context),
            ),
            SafeArea(
              child: Column(
                children: [
                  verticalSpace(24.0),
                  Stack(
                    children: [
                      Image.asset(
                        AppImages.moduleBoard2,
                        fit: BoxFit.cover,
                        width: screenWidth(context),
                      ),
                      SizedBox(
                        height:
                            screenHeightPercentage(context, percentage: .58),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            children: [
                              verticalSpace(64.0),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Html(
                                    data: slideDesc ?? '',
                                    style: {
                                      "span": Style(
                                        fontSize: FontSize(AppDimens.body),
                                        color: Colors.white,
                                        textAlign: TextAlign.center,
                                      ),
                                      "p": Style(
                                        fontSize: FontSize(AppDimens.body),
                                        color: Colors.white,
                                      ),
                                      "strong": Style(
                                        fontSize: FontSize(AppDimens.headline),
                                        color: Colors.white,
                                        textAlign: TextAlign.center,
                                      ),
                                    },
                                    extensions: [
                                      TagExtension(
                                        tagsToExtend: {"img"},
                                        builder: (context) {
                                          final attributes = context.attributes;
                                          final imageUrl = attributes['src'] ?? '';
                                          final width = double.tryParse(attributes['width'] ?? '') ?? double.infinity;
                                          final height = double.tryParse(attributes['height'] ?? '') ?? null;

                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Image.network(
                                              imageUrl,
                                              width: width,
                                              height: height,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              left: 0.0,
              child: SizedBox(
                height: screenHeightPercentage(context, percentage: .45),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: -16.0,
                      right: -32.0,
                      child: Hero(
                        tag: AppStrings.tagAnteenaGlasses,
                        child: Image.asset(
                          AppImages.glassesAnteena,
                          fit: BoxFit.fill,
                          height: screenHeightPercentage(
                            context,
                            percentage: .35,
                          ),
                        ),
                      ),
                    ),
                    if (controller.isShowNarrative.value)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                        ),
                        child: Container(
                          height: 180,
                          width: screenWidth(context),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                (narrativeDesc ?? '').replaceAll('[username]',
                                    controller.profileLocal.name ?? ''),
                                style: blackSemiBoldTextStyle.copyWith(
                                  fontSize: AppDimens.bodySmall,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    Positioned(
                      bottom: 38.0,
                      right: 0.0,
                      left: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            controller.indexSlide.value != 0
                                ? GestureDetector(
                                    onTap: () => controller.backSlide(),
                                    child: Image.asset(
                                      AppImages.iconArrowBack,
                                      height: 40,
                                    ),
                                  )
                                : Container(),
                            GestureDetector(
                              onTap: () => controller.nextSlide(),
                              child: Image.asset(
                                AppImages.iconArrowNext,
                                height: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            MenuModule(
              onHomeTapped: () => controller.showHome(),
              onSettingTapped: () => controller.showSettingDialog(),
            ),
          ],
        );
      }),
    );
  }
}
