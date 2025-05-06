import '../../data/model/requests/diary_mood_request.dart';
import '../../data/model/requests/diary_phobia_list_request.dart';
import '../../data/model/requests/diary_request.dart';
import '../../data/model/requests/diary_wish_list_request.dart';
import '../../utils/type_defs.dart';
import '../entity/diary.dart';
import '../entity/diary_phobia_list.dart';

abstract class DiaryRepository {
  FutureEither<List<Diary>> getDiaries(String? date);

  FutureEither<Diary> getDiary(int diaryId);

  FutureEither<int> addDiary(DiaryRequest request);

  FutureEither addDiaryMood(DiaryMoodRequest request);

  FutureEither addDiaryWishList(DiaryWishListRequest request);

  FutureEither addDiaryPhobiaList(DiaryPhobiaListRequest request);

  FutureEither<List<DiaryPhobiaList>> getDiaryPhobiaList(int diaryId);
}
