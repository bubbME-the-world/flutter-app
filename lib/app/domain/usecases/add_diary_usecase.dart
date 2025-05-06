import '../../data/model/requests/diary_request.dart';
import '../../utils/type_defs.dart';
import '../repositories/diary_repository.dart';

class AddDiaryUseCase {
  final DiaryRepository repository;

  AddDiaryUseCase(this.repository);

  FutureEither<int> execute(DiaryRequest request) {
    return repository.addDiary(request);
  }
}
