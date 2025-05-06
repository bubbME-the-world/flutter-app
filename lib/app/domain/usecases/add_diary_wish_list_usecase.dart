import '../../data/model/requests/diary_wish_list_request.dart';
import '../../utils/type_defs.dart';
import '../repositories/diary_repository.dart';

class AddDiaryWishListUseCase {
  final DiaryRepository repository;

  AddDiaryWishListUseCase(this.repository);

  FutureEither execute(DiaryWishListRequest request) {
    return repository.addDiaryWishList(request);
  }
}
