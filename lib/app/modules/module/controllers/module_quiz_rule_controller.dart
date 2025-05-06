import 'package:bubbme/app/shared_ui/style/app_audios.dart';
import 'package:get/get.dart';

import '../../../core/base_controller.dart';
import '../../../domain/entity/slide.dart';
import '../../../enum/quiz_rule_enum.dart';
import '../../../routes/app_pages.dart';

class ModuleQuizRuleController extends BaseController {
  final time = 3.obs;

  final quizRule = Rx<QuizRuleEnum?>(QuizRuleEnum.confirmation);

  final slides = Rx<List<Slide>?>(null);
  final isChallenge = false.obs;

  @override
  void onInit() {
    super.onInit();
    final List<dynamic> args = Get.arguments;
    slides.value = args[0] as List<Slide>;
    isChallenge.value = args[1] as bool;
    setAudio(AppAudios.lectureSongPart3);
  }

  void showRule() => quizRule.value = QuizRuleEnum.rule;

  void showTimer() {
    quizRule.value = QuizRuleEnum.timer;
    Future.delayed(
      const Duration(seconds: 1),
      () {
        time.value--;
        if (time.value > 0) {
          showTimer();
        } else {
          showQuiz(slides.value ?? []);
        }
      },
    );
  }

  void showQuiz(List<Slide> slides) => Get.offNamed(
        Routes.MODULE_QUIZ,
        arguments: [
          slides,
          isChallenge.value,
        ],
      );
}
