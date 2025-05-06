import '../../data/model/requests/period_symptom_request.dart';
import '../../utils/type_defs.dart';
import '../entity/add_period_data.dart';
import '../repositories/period_repository.dart';

class AddPeriodSymptomUseCase {
  final PeriodRepository repository;

  AddPeriodSymptomUseCase(this.repository);

  FutureEither<AddPeriodData> execute(PeriodSymptomRequest request) {
    return repository.setPeriodSymptom(request);
  }
}
