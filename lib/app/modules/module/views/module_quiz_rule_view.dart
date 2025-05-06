import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../enum/quiz_rule_enum.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../utils/ui_helpers.dart';
import '../controllers/module_quiz_rule_controller.dart';
import '../widgets/menu_module.dart';
import '../widgets/quiz_confirmation.dart';
import '../widgets/quiz_rule.dart';
import '../widgets/quiz_timer.dart';

class ModuleQuizRuleView extends GetView<ModuleQuizRuleController> {
  const ModuleQuizRuleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: screenWidth(context),
            height: screenHeight(context),
            child: Image.asset(
              AppImages.quizRuleBackground,
              fit: BoxFit.fill,
            ),
          ),
          Obx(() {
            final quizRule = controller.quizRule.value;
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: quizRule == QuizRuleEnum.confirmation
                    ? QuizConfirmation(
                        onGoTapped: () => controller.showRule(),
                        isChallenge: controller.isChallenge,
                      )
                    : quizRule == QuizRuleEnum.rule
                        ? QuizRule(onGoTapped: () => controller.showTimer())
                        : QuizTimer(
                            time: controller.time.value.toString(),
                          ),
              ),
            );
          }),
          MenuModule(
            onHomeTapped: () => controller.showHome(),
            onSettingTapped: () => controller.showSettingDialog(),
          ),
        ],
      ),
    );
  }
}
