import '../../utils/type_defs.dart';
import '../entity/mood.dart';
import '../repositories/mood_repository.dart';

class MoodTodayUseCase {
  final MoodRepository repository;

  MoodTodayUseCase(this.repository);

  FutureEither<List<Mood>> execute(String date) {
    return repository.getMoodToday(date);
  }
}
