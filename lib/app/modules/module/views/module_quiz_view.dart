import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_strings.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../utils/ui_helpers.dart';
import '../controllers/module_quiz_controller.dart';
import '../widgets/menu_module.dart';

class ModuleQuizView extends GetView<ModuleQuizController> {
  const ModuleQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.moduleBackground,
            fit: BoxFit.fill,
            height: screenHeight(context),
            width: screenWidth(context),
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: AppStrings.tagAnteenaGlasses,
                  child: Image.asset(
                    AppImages.glassesAnteena,
                    fit: BoxFit.fill,
                    height: screenHeightPercentage(
                      context,
                      percentage: .25,
                    ),
                  ),
                ),
                if (controller.isChallenge.isTrue)
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                      top: 54.0,
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [shadow],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8.0,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                AppImages.clock,
                                height: 32.0,
                              ),
                              horizontalSpace(8.0),
                              Obx(
                                () {
                                  return Text(
                                    controller.timerString,
                                    style: primaryBoldTextStyle.copyWith(
                                      fontSize: AppDimens.bodySmall,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        )),
                  ),
              ],
            ),
          ),
          Column(
            children: [
              verticalSpace(
                screenHeightPercentage(
                  context,
                  percentage: .16,
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Image.asset(
                      AppImages.moduleBoard,
                      fit: BoxFit.cover,
                      height: screenHeight(context),
                      width: screenWidth(context),
                    ),
                    Obx(() {
                      final questionDesc = controller
                          .quizSlides
                          .value?[controller.indexQuiz.value]
                          .board
                          ?.first
                          .moduleQuestion;
                      final multipleChoice = controller
                          .quizSlides
                          .value?[controller.indexQuiz.value]
                          .board
                          ?.first
                          .listMultipleChoice;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            verticalSpace(64.0),
                            Text(
                              LocaleKeys.questionDesc.tr,
                              style: whiteBoldTextStyle.copyWith(
                                fontSize: AppDimens.headline,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            verticalSpace(24.0),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Html(
                                  data: questionDesc ?? '',
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
                            verticalSpace(24.0),
                            ...List.generate(
                              multipleChoice?.length ?? 0,
                              (index) {
                                final choice = multipleChoice?[index];
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8.0,
                                  ),
                                  child: GestureDetector(
                                    onTap: () => controller.nextQuiz(choice!),
                                    child: Container(
                                      width: screenWidth(context),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        boxShadow: [shadow],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8.0,
                                          horizontal: 16.0,
                                        ),
                                        child: Text(
                                          choice?.answer ?? '',
                                          style: primaryBoldTextStyle.copyWith(
                                            fontSize: AppDimens.bodySmall,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            verticalSpace(100.0),
                          ],
                        ),
                      );
                    }),
                  ],
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
