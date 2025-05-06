import '../../utils/type_defs.dart';
import '../entity/mood.dart';
import '../repositories/mood_repository.dart';

class MoodsUseCase {
  final MoodRepository repository;

  MoodsUseCase(this.repository);

  FutureEither<List<Mood>> execute() {
    return repository.getMoods();
  }
}
