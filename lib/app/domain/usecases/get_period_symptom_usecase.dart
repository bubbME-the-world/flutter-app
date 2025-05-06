import '../../utils/type_defs.dart';
import '../entity/period_symptom.dart';
import '../repositories/period_repository.dart';

class GetPeriodSymptomUseCase {
  final PeriodRepository repository;

  GetPeriodSymptomUseCase(this.repository);

  FutureEither<List<PeriodSymptom>> execute(int periodId) {
    return repository.getPeriodSymptom(periodId);
  }
}
