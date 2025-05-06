import 'package:bubbme/app/data/model/requests/diary_mood_request.dart';
import 'package:bubbme/app/data/model/requests/diary_phobia_list_request.dart';
import 'package:bubbme/app/data/model/requests/diary_request.dart';
import 'package:bubbme/app/data/model/requests/diary_wish_list_request.dart';
import 'package:bubbme/app/domain/entity/diary.dart';
import 'package:dartz/dartz.dart';

import '../../core/service/network_exceptions.dart';
import '../../domain/entity/diary_phobia_list.dart';
import '../../domain/repositories/diary_repository.dart';
import '../../utils/type_defs.dart';
import '../datasource/diary_data_source.dart';
import '../model/responses/failure_response.dart';

class DiaryRepositoryImpl extends DiaryRepository {
  final DiaryDataSource _dataSource;

  DiaryRepositoryImpl({
    required DiaryDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  FutureEither<List<Diary>> getDiaries(String? date) async {
    try {
      final response = await _dataSource.getDiaries(date);
      return right(response.data?.map((e) => e.toEntity()).toList() ?? []);
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
  FutureEither<Diary> getDiary(int diaryId) async {
    try {
      final response = await _dataSource.getDiary(diaryId);
      final diary =
          (response.data?.map((e) => e.toEntity()).toList() ?? []).first;
      return right(diary);
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
  FutureEither<int> addDiary(DiaryRequest request) async {
    try {
      final response = await _dataSource.addDiary(request.toJson());
      return right(response.id ?? 0);
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
  FutureEither addDiaryMood(DiaryMoodRequest request) async {
    try {
      await _dataSource.addDiaryMood(request.toJson());
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
  FutureEither addDiaryWishList(DiaryWishListRequest request) async {
    try {
      await _dataSource.addDiaryWishList(request.toJson());
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
  FutureEither addDiaryPhobiaList(DiaryPhobiaListRequest request) async {
    try {
      await _dataSource.addDiaryPhobiaList(request.toJson());
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
  FutureEither<List<DiaryPhobiaList>> getDiaryPhobiaList(int diaryId) async {
    try {
      final response = await _dataSource.getDiaryPhobiaList(diaryId);
      final diaryPhobia =
          (response.data?.map((e) => e.toEntity()).toList() ?? []);
      return right(diaryPhobia);
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
