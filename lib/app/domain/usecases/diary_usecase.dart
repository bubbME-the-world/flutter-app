import '../../utils/type_defs.dart';
import '../entity/diary.dart';
import '../repositories/diary_repository.dart';

class DiaryUseCase {
  final DiaryRepository repository;

  DiaryUseCase(this.repository);

  FutureEither<Diary> execute(int diaryId) {
    return repository.getDiary(diaryId);
  }
}
