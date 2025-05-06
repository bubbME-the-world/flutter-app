import '../../data/model/requests/mood_request.dart';
import '../../utils/type_defs.dart';
import '../entity/mood.dart';

abstract class MoodRepository {
  FutureEither<List<Mood>> getMoods();

  FutureEither addMood(MoodRequest request);

  FutureEither<List<Mood>> getMoodToday(String date);
}
