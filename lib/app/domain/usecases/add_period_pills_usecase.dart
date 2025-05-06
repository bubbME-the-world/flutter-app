import '../../data/model/requests/period_pills_request.dart';
import '../../utils/type_defs.dart';
import '../entity/add_period_data.dart';
import '../repositories/period_repository.dart';

class AddPeriodPillsUseCase {
  final PeriodRepository repository;

  AddPeriodPillsUseCase(this.repository);

  FutureEither<AddPeriodData> execute(PeriodPillsRequest request) {
    return repository.setPeriodPills(request);
  }
}
