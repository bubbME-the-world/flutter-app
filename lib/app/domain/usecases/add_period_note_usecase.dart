import '../../data/model/requests/period_note_request.dart';
import '../../utils/type_defs.dart';
import '../entity/add_period_data.dart';
import '../repositories/period_repository.dart';

class AddPeriodNoteUseCase {
  final PeriodRepository repository;

  AddPeriodNoteUseCase(this.repository);

  FutureEither<AddPeriodData> execute(PeriodNoteRequest request) {
    return repository.setPeriodNote(request);
  }
}
