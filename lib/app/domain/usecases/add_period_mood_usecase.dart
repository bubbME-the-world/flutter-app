import '../../data/model/requests/period_mood_request.dart';
import '../../utils/type_defs.dart';
import '../entity/add_period_data.dart';
import '../repositories/period_repository.dart';

class AddPeriodMoodUseCase {
  final PeriodRepository repository;

  AddPeriodMoodUseCase(this.repository);

  FutureEither<AddPeriodData> execute(PeriodMoodRequest request) {
    return repository.setPeriodMood(request);
  }
}
