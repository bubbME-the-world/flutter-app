import '../../utils/type_defs.dart';
import '../entity/period_note.dart';
import '../repositories/period_repository.dart';

class GetPeriodNoteUseCase {
  final PeriodRepository repository;

  GetPeriodNoteUseCase(this.repository);

  FutureEither<List<PeriodNote>> execute(int periodId) {
    return repository.getPeriodNote(periodId);
  }
}
