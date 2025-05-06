import '../../utils/type_defs.dart';
import '../entity/period_pills.dart';
import '../repositories/period_repository.dart';

class GetPeriodPillsUseCase {
  final PeriodRepository repository;

  GetPeriodPillsUseCase(this.repository);

  FutureEither<List<PeriodPills>> execute(int periodId) {
    return repository.getPeriodPills(periodId);
  }
}
