import '../../data/model/requests/period_request.dart';
import '../../utils/type_defs.dart';
import '../entity/period_data.dart';
import '../repositories/period_repository.dart';

class AddPeriodUseCase {
  final PeriodRepository repository;

  AddPeriodUseCase(this.repository);

  FutureEither<PeriodData> execute(PeriodRequest request) {
    return repository.setPeriod(request);
  }
}
