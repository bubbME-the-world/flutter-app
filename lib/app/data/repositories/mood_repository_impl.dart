import 'package:bubbme/app/data/model/requests/mood_request.dart';
import 'package:dartz/dartz.dart';

import '../../core/service/network_exceptions.dart';
import '../../domain/entity/mood.dart';
import '../../domain/repositories/mood_repository.dart';
import '../../utils/type_defs.dart';
import '../datasource/mood_data_source.dart';
import '../model/responses/failure_response.dart';

class MoodRepositoryImpl extends MoodRepository {
  final MoodDataSource _dataSource;

  MoodRepositoryImpl({
    required MoodDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  FutureEither<List<Mood>> getMoods() async {
    try {
      final response = await _dataSource.getMoods();
      return right(response.data!.map((e) => e.toEntity()).toList());
    } catch (e) {
      return left(
        FailureResponse(
          error: NetworkExceptions.getDioException(e),
          errorRes: NetworkExceptions.getErrorRes(e),
        ),
      );
    }
  }

  @override
  FutureEither addMood(MoodRequest request) async {
    try {
      await _dataSource.addMood(request.toJson());
      return right(null);
    } catch (e) {
      return left(
        FailureResponse(
          error: NetworkExceptions.getDioException(e),
          errorRes: NetworkExceptions.getErrorRes(e),
        ),
      );
    }
  }

  @override
  FutureEither<List<Mood>> getMoodToday(String date) async {
    try {
      final response = await _dataSource.getMoodToday(date);
      return right(response.data!.map((e) => e.toEntity()).toList());
    } catch (e) {
      return left(
        FailureResponse(
          error: NetworkExceptions.getDioException(e),
          errorRes: NetworkExceptions.getErrorRes(e),
        ),
      );
    }
  }
}
