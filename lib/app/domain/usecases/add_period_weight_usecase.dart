import '../../data/model/requests/period_weight_request.dart';
import '../../utils/type_defs.dart';
import '../entity/add_period_data.dart';
import '../repositories/period_repository.dart';

class AddPeriodWeightUseCase {
  final PeriodRepository repository;

  AddPeriodWeightUseCase(this.repository);

  FutureEither<AddPeriodData> execute(PeriodWeightRequest request) {
    return repository.setPeriodWeight(request);
  }
}
