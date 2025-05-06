import '../../utils/type_defs.dart';
import '../entity/symptom.dart';
import '../repositories/period_repository.dart';

class GetSymptomUseCase {
  final PeriodRepository repository;

  GetSymptomUseCase(this.repository);

  FutureEither<List<Symptom>> execute() {
    return repository.getSymptom();
  }
}
