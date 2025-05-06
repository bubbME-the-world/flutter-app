import 'package:bubbme/app/core/service/network_exceptions.dart';
import 'package:get/get.dart';

import '../../../core/base_controller.dart';
import '../../../data/model/requests/period_mood_request.dart';
import '../../../data/model/requests/period_note_request.dart';
import '../../../data/model/requests/period_pills_request.dart';
import '../../../data/model/requests/period_symptom_request.dart';
import '../../../data/model/requests/period_weight_request.dart';
import '../../../di/injectore.dart';
import '../../../domain/entity/mood.dart';
import '../../../domain/entity/period.dart';
import '../../../domain/entity/period_note.dart';
import '../../../domain/entity/period_pills.dart';
import '../../../domain/entity/period_symptom.dart';
import '../../../domain/entity/period_weight.dart';
import '../../../domain/entity/symptom.dart';
import '../../../domain/usecases/add_period_mood_usecase.dart';
import '../../../domain/usecases/add_period_note_usecase.dart';
import '../../../domain/usecases/add_period_pills_usecase.dart';
import '../../../domain/usecases/add_period_symptom_usecase.dart';
import '../../../domain/usecases/add_period_weight_usecase.dart';
import '../../../domain/usecases/get_period_note_usecase.dart';
import '../../../domain/usecases/get_period_pills_usecase.dart';
import '../../../domain/usecases/get_period_symptom_usecase.dart';
import '../../../domain/usecases/get_period_weight_usecase.dart';
import '../../../domain/usecases/get_symptom_usecase.dart';
import '../../../domain/usecases/moods_usecase.dart';
import '../../../shared_ui/widgets/dialogs/detail_mood_dialog.dart';
import '../../../shared_ui/widgets/dialogs/mood_dialog.dart';
import '../../../shared_ui/widgets/dialogs/my_notes_dialog.dart';
import '../../../shared_ui/widgets/dialogs/my_pills_dialog.dart';
import '../../../shared_ui/widgets/dialogs/my_symptom_dialog.dart';
import '../../../shared_ui/widgets/dialogs/my_weight_dialog.dart';

class MyRecordMenuController extends BaseController {
  final _addPeriodNoteUseCase = injector<AddPeriodNoteUseCase>();
  final _getPeriodNoteUseCase = injector<GetPeriodNoteUseCase>();
  final _addPeriodPillsUseCase = injector<AddPeriodPillsUseCase>();
  final _getPeriodPillsUseCase = injector<GetPeriodPillsUseCase>();
  final _addPeriodWeightUseCase = injector<AddPeriodWeightUseCase>();
  final _getPeriodWeightUseCase = injector<GetPeriodWeightUseCase>();
  final _addPeriodMoodUseCase = injector<AddPeriodMoodUseCase>();
  final _moodsUseCase = injector<MoodsUseCase>();
  final _getPeriodSymptomUseCase = injector<GetPeriodSymptomUseCase>();
  final _getSymptomUseCase = injector<GetSymptomUseCase>();
  final _addPeriodSymptomUseCase = injector<AddPeriodSymptomUseCase>();

  final period = Rx<Period?>(null);
  final moodFirst = Rx<Mood?>(null);
  final moodSecond = Rx<Mood?>(null);
  final moodThird = Rx<Mood?>(null);

  Future<void> getPeriodNote() async {
    showLoadingDialog();
    final result =
        await _getPeriodNoteUseCase.execute(period.value?.periodId ?? 0);
    hideLoadingDialog();
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        showFailed(message: errorMessage ?? '');
      },
      (data) {
        if (data.isEmpty) {
          showMyNotesDialog(PeriodNote());
          return;
        }
        showMyNotesDialog(data.first);
      },
    );
  }

  Future<void> setPeriodNote(String note) async {
    showLoadingDialog();
    final request = PeriodNoteRequest(
      periodId: period.value?.periodId,
      note: note,
    );
    final result = await _addPeriodNoteUseCase.execute(request);
    hideLoadingDialog();
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        showFailed(message: errorMessage ?? '');
      },
      (data) {
        showToast(message: 'Note saved successfully');
      },
    );
  }

  Future<void> getPeriodPills() async {
    showLoadingDialog();
    final result =
        await _getPeriodPillsUseCase.execute(period.value?.periodId ?? 0);
    hideLoadingDialog();
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        showFailed(message: errorMessage ?? '');
      },
      (data) {
        if (data.isEmpty) {
          showMyPillsDialog(PeriodPills());
          return;
        }
        showMyPillsDialog(data.first);
      },
    );
  }

  Future<void> setPeriodPills(String pills) async {
    showLoadingDialog();
    final request = PeriodPillsRequest(
      periodId: period.value?.periodId,
      periodPills: pills,
    );
    final result = await _addPeriodPillsUseCase.execute(request);
    hideLoadingDialog();
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        showFailed(message: errorMessage ?? '');
      },
      (data) {
        showToast(message: 'Period Pills saved successfully');
      },
    );
  }

  Future<void> getPeriodWeight() async {
    showLoadingDialog();
    final result =
        await _getPeriodWeightUseCase.execute(period.value?.periodId ?? 0);
    hideLoadingDialog();
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        showFailed(message: errorMessage ?? '');
      },
      (data) {
        if (data.isEmpty) {
          showMyWeightDialog(PeriodWeight());
          return;
        }
        showMyWeightDialog(data.first);
      },
    );
  }

  Future<void> setPeriodWeight(String weight) async {
    showLoadingDialog();
    final request = PeriodWeightRequest(
      periodId: period.value?.periodId,
      periodWeight: weight,
    );
    final result = await _addPeriodWeightUseCase.execute(request);
    hideLoadingDialog();
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        showFailed(message: errorMessage ?? '');
      },
      (data) {
        showToast(message: 'My Weight saved successfully');
      },
    );
  }

  Future<void> setPeriodMood() async {
    showLoadingDialog();
    final request = PeriodMoodRequest(
      periodId: period.value?.periodId,
      moodId: moodFirst.value?.moodId,
      moodSecondId: moodSecond.value?.moodId,
      moodThirdId: moodThird.value?.moodId,
    );
    final result = await _addPeriodMoodUseCase.execute(request);
    hideLoadingDialog();
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        showFailed(message: errorMessage ?? '');
      },
      (data) {
        showToast(message: 'Period Mood saved successfully');
      },
    );
  }

  Future<void> getMoods() async {
    showLoadingDialog();
    final result = await _moodsUseCase.execute();
    hideLoadingDialog();
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        showFailed(message: errorMessage ?? '');
      },
      (data) {
        showMoodDialog(data);
      },
    );
  }

  Future<void> getPeriodSymptom() async {
    showLoadingDialog();
    final result =
        await _getPeriodSymptomUseCase.execute(period.value?.periodId ?? 0);
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        showFailed(message: errorMessage ?? '');
      },
      (data) {
        if (data.isEmpty) {
          getSymptom([]);
          return;
        }
        getSymptom(data);
      },
    );
  }

  Future<void> getSymptom(List<PeriodSymptom> periodSymptom) async {
    final result = await _getSymptomUseCase.execute();
    hideLoadingDialog();
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        showFailed(message: errorMessage ?? '');
      },
      (data) => showMySymptomDialog(
        periodSymptom,
        data,
      ),
    );
  }

  Future<void> setPeriodSymptom(List<int> symptomSelectedID) async {
    showLoadingDialog();
    final request = PeriodSymptomRequest(
      periodId: period.value?.periodId,
      periodSymptom: symptomSelectedID,
    );
    final result = await _addPeriodSymptomUseCase.execute(request);
    hideLoadingDialog();
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        showFailed(message: errorMessage ?? '');
      },
      (data) {
        showToast(message: 'Period Symptom saved successfully');
      },
    );
  }

  void showMyNotesDialog(PeriodNote periodNote) {
    Get.dialog(
      MyNotesDialog(
        periodNote: periodNote,
        onSaveTapped: (note) {
          Get.back();
          setPeriodNote(note);
        },
      ),
    );
  }

  void showMyPillsDialog(PeriodPills periodPills) {
    Get.dialog(
      MyPillsDialog(
        periodPills: periodPills,
        onSaveTapped: (pills) {
          Get.back();
          setPeriodPills(pills);
        },
      ),
    );
  }

  void showMyWeightDialog(PeriodWeight periodWeight) {
    Get.dialog(
      MyWeightDialog(
        periodWeight: periodWeight,
        onSaveTapped: (weight) {
          Get.back();
          setPeriodWeight(weight);
        },
      ),
    );
  }

  void showMoodDialog(List<Mood> moods) => Get.dialog(
        MoodDialog(
          moods: moods,
          onTap: (mood) => showDetailMoodDialog(mood),
        ),
      );

  void showDetailMoodDialog(Mood mood) {
    Get.dialog(
      DetailMoodDialog(
        moodSelected: mood,
        moodFirst: (mood) => moodFirst.value = mood,
        moodSecond: (mood) => moodSecond.value = mood,
        moodThird: (mood) {
          moodThird.value = mood;
          setPeriodMood();
          Get.back();
        },
      ),
    );
  }

  void showMySymptomDialog(
    List<PeriodSymptom> periodSymptom,
    List<Symptom> symptom,
  ) {
    Get.dialog(
      MySymptomDialog(
        periodSymptom: periodSymptom.first.data ?? [],
        symptom: symptom,
        onSaveTapped: (symptomSelected) {
          Get.back();
          setPeriodSymptom(symptomSelected);
        },
      ),
    );
  }
}
