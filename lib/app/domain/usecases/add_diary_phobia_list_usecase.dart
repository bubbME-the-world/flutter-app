import '../../data/model/requests/diary_phobia_list_request.dart';
import '../../utils/type_defs.dart';
import '../repositories/diary_repository.dart';

class AddDiaryPhobiaListUseCase {
  final DiaryRepository repository;

  AddDiaryPhobiaListUseCase(this.repository);

  FutureEither execute(DiaryPhobiaListRequest request) {
    return repository.addDiaryPhobiaList(request);
  }
}
