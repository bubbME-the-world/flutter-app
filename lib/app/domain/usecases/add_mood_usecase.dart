import '../../data/model/requests/mood_request.dart';
import '../../utils/type_defs.dart';
import '../repositories/mood_repository.dart';

class AddMoodUseCase {
  final MoodRepository repository;

  AddMoodUseCase(this.repository);

  FutureEither execute(MoodRequest request) {
    return repository.addMood(request);
  }
}
