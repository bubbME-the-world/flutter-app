import '../../utils/type_defs.dart';
import '../entity/period_weight.dart';
import '../repositories/period_repository.dart';

class GetPeriodWeightUseCase {
  final PeriodRepository repository;

  GetPeriodWeightUseCase(this.repository);

  FutureEither<List<PeriodWeight>> execute(int periodId) {
    return repository.getPeriodWeight(periodId);
  }
}
