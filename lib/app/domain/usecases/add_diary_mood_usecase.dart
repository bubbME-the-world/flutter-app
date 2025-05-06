import '../../data/model/requests/diary_mood_request.dart';
import '../../utils/type_defs.dart';
import '../repositories/diary_repository.dart';

class AddDiaryMoodUseCase {
  final DiaryRepository repository;

  AddDiaryMoodUseCase(this.repository);

  FutureEither execute(DiaryMoodRequest request) {
    return repository.addDiaryMood(request);
  }
}
