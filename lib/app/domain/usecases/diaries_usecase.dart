import '../../utils/type_defs.dart';
import '../entity/diary.dart';
import '../repositories/diary_repository.dart';

class DiariesUseCase {
  final DiaryRepository repository;

  DiariesUseCase(this.repository);

  FutureEither<List<Diary>> execute({String? date}) {
    return repository.getDiaries(date);
  }
}
