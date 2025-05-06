import '../../data/model/requests/period_mood_request.dart';
import '../../data/model/requests/period_note_request.dart';
import '../../data/model/requests/period_pills_request.dart';
import '../../data/model/requests/period_request.dart';
import '../../data/model/requests/period_symptom_request.dart';
import '../../data/model/requests/period_weight_request.dart';
import '../../utils/type_defs.dart';
import '../entity/add_period_data.dart';
import '../entity/period_data.dart';
import '../entity/period_note.dart';
import '../entity/period_pills.dart';
import '../entity/period_symptom.dart';
import '../entity/period_weight.dart';
import '../entity/symptom.dart';

abstract class PeriodRepository {
  FutureEither<PeriodData> getPeriod();

  FutureEither<PeriodData> setPeriod(PeriodRequest request);

  FutureEither<AddPeriodData> setPeriodNote(PeriodNoteRequest request);

  FutureEither<List<PeriodNote>> getPeriodNote(int periodId);

  FutureEither<AddPeriodData> setPeriodPills(PeriodPillsRequest request);

  FutureEither<List<PeriodPills>> getPeriodPills(int periodId);

  FutureEither<AddPeriodData> setPeriodWeight(PeriodWeightRequest request);

  FutureEither<List<PeriodWeight>> getPeriodWeight(int periodId);

  FutureEither<AddPeriodData> setPeriodMood(PeriodMoodRequest request);

  FutureEither<List<Symptom>> getSymptom();

  FutureEither<List<PeriodSymptom>> getPeriodSymptom(int periodId);

  FutureEither<AddPeriodData> setPeriodSymptom(PeriodSymptomRequest request);
}
