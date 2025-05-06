import '../../utils/type_defs.dart';
import '../entity/period_data.dart';
import '../repositories/period_repository.dart';

class PeriodUseCase {
  final PeriodRepository repository;

  PeriodUseCase(this.repository);

  FutureEither<PeriodData> execute() {
    return repository.getPeriod();
  }
}
