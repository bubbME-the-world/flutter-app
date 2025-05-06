import '../../utils/type_defs.dart';
import '../entity/diary_phobia_list.dart';
import '../repositories/diary_repository.dart';

class DiaryPhobiaUseCase {
  final DiaryRepository repository;

  DiaryPhobiaUseCase(this.repository);

  FutureEither<List<DiaryPhobiaList>> execute(int diaryId) {
    return repository.getDiaryPhobiaList(diaryId);
  }
}
