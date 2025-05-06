import 'package:get/get.dart';

import '../../../core/base_controller.dart';
import '../../../domain/entity/slide.dart';
import '../../../enum/type_slide_enum.dart';
import '../../../routes/app_pages.dart';

class ModuleLearningController extends BaseController {
  final slides = Rx<List<Slide>?>(null);
  final boardSlides = Rx<List<Slide>?>(null);
  final narrativeSlides = Rx<List<Slide>?>(null);

  final indexSlide = 0.obs;
  final indexNarrative = 0.obs;
  final isShowNarrative = false.obs;

  @override
  void onInit() {
    super.onInit();
    slides.value = Get.arguments as List<Slide>;
    getProfileLocal();
    setSlidesByType();
  }

  void setSlidesByType() {
    boardSlides.value = slides.value!
        .where((slide) => slide.typeSlide == TypeSlideEnum.board.display)
        .toList();
    narrativeSlides.value = slides.value!
        .where((slide) => slide.typeSlide == TypeSlideEnum.narrative.display)
        .toList();

    setNarrativeToBoard();
  }

  void setNarrativeToBoard() {
    boardSlides.value?.forEach((boardSlide) {
      narrativeSlides.value?.forEach((narrativeSlide) {
        if (boardSlide.slideName == narrativeSlide.slideName) {
          boardSlide.narrative = narrativeSlide.narrative;
        }
      });
    });
  }

  void nextSlide() {
    if (isShowNarrative.value) {
      if (indexNarrative.value <
          boardSlides.value![indexSlide.value].narrative!.first
                  .listMultipleChoice!.length -
              1) {
        indexNarrative.value++;
      } else {
        isShowNarrative.value = false;
        indexSlide.value++;
        indexNarrative.value = 0;
      }
      return;
    }
    if (indexSlide.value < boardSlides.value!.length - 1) {
      if (boardSlides.value![indexSlide.value].narrative != null) {
        isShowNarrative.value = true;
      } else {
        isShowNarrative.value = false;
        indexSlide.value++;
      }
    } else {
      showRule();
    }
  }

  void backSlide() {
    if (isShowNarrative.value) {
      if (indexNarrative.value > 0) {
        indexNarrative.value--;
      } else {
        isShowNarrative.value = false;
      }
      return;
    }
    if (indexSlide.value > 0) {
      isShowNarrative.value = false;
      indexSlide.value--;
    }
  }

  void showRule() => Get.offNamed(
        Routes.MODULE_QUIZ_RULE,
        arguments: [
          slides.value,
          true,
        ],
      );
}
