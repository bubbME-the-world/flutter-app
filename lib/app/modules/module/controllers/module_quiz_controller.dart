import 'dart:async';

import 'package:get/get.dart';

import '../../../core/base_controller.dart';
import '../../../domain/entity/multiple_choice.dart';
import '../../../domain/entity/slide.dart';
import '../../../enum/type_slide_enum.dart';
import '../../../routes/app_pages.dart';

class ModuleQuizController extends BaseController {
  final slides = Rx<List<Slide>?>(null);
  final quizSlides = Rx<List<Slide>?>(null);
  final boardSlides = Rx<List<Slide>?>(null);

  final indexQuiz = 0.obs;
  final isChallenge = false.obs;
  final timer = 0.obs;
  final totalCorrectAnswer = 0.obs;

  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    final List<dynamic> args = Get.arguments;
    slides.value = args[0] as List<Slide>;
    isChallenge.value = args[1] as bool;
    setSlidesByType();
    if (isChallenge.value) {
      startTimer();
    }
  }

  void startTimer() {
    timer.value = quizSlides.value!.length * 30;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (this.timer.value == 0) {
          showModuleResult();
        } else {
          this.timer.value--;
        }
      },
    );
  }

  String get timerString {
    final minutes = timer.value ~/ 60;
    final seconds = timer.value % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  void setSlidesByType() {
    quizSlides.value = slides.value!
        .where((slide) => slide.typeSlide == TypeSlideEnum.quiz.display)
        .toList();
    boardSlides.value = slides.value!
        .where((slide) => slide.typeSlide == TypeSlideEnum.board.display)
        .toList();
  }

  void nextQuiz(MultipleChoice choice) {
    if (indexQuiz.value < quizSlides.value!.length - 1) {
      if (isChallenge.isTrue && choice.correctAnswer == true) {
        totalCorrectAnswer.value++;
      }
      indexQuiz.value++;
    } else {
      if (isChallenge.isTrue) {
        showModuleResult();
      } else {
        showModuleLearning();
      }
    }
  }

  void showModuleLearning() => Get.offNamed(
        Routes.MODULE_LEARNING,
        arguments: slides.value,
      );

  void showModuleResult() {
    _timer.cancel();
    final average = totalCorrectAnswer.value / quizSlides.value!.length;
    final totalScore = average * timer.value;
    Get.offNamed(
      Routes.MODULE_REWARD,
      arguments: totalScore.toInt(),
    );
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
