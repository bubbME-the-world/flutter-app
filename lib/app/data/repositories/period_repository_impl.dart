import 'package:bubbme/app/data/model/requests/period_mood_request.dart';
import 'package:bubbme/app/data/model/requests/period_symptom_request.dart';
import 'package:bubbme/app/data/model/requests/period_weight_request.dart';
import 'package:bubbme/app/domain/entity/period_symptom.dart';
import 'package:bubbme/app/domain/entity/period_weight.dart';
import 'package:bubbme/app/domain/entity/symptom.dart';
import 'package:dartz/dartz.dart';

import '../../core/service/network_exceptions.dart';
import '../../domain/entity/add_period_data.dart';
import '../../domain/entity/period_data.dart';
import '../../domain/entity/period_note.dart';
import '../../domain/entity/period_pills.dart';
import '../../domain/repositories/period_repository.dart';
import '../../utils/type_defs.dart';
import '../datasource/period_data_source.dart';
import '../model/requests/period_note_request.dart';
import '../model/requests/period_pills_request.dart';
import '../model/requests/period_request.dart';
import '../model/responses/failure_response.dart';

class PeriodRepositoryImpl extends PeriodRepository {
  final PeriodDataSource _dataSource;

  PeriodRepositoryImpl({
    required PeriodDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  FutureEither<PeriodData> getPeriod() async {
    try {
      final response = await _dataSource.getPeriod();
      return right(response.toEntity());
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
  FutureEither<PeriodData> setPeriod(PeriodRequest request) async {
    try {
      final body = request.toJson();
      final response = await _dataSource.setPeriod(body);
      return right(response.toEntity());
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
  FutureEither<AddPeriodData> setPeriodNote(PeriodNoteRequest request) async {
    try {
      final body = request.toJson();
      final response = await _dataSource.setNotePeriod(body);
      return right(response.toEntity());
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
  FutureEither<List<PeriodNote>> getPeriodNote(int periodId) async {
    try {
      final response = await _dataSource.getNotePeriod(periodId);
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
  FutureEither<AddPeriodData> setPeriodPills(PeriodPillsRequest request) async {
    try {
      final body = request.toJson();
      final response = await _dataSource.setPillsPeriod(body);
      return right(response.toEntity());
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
  FutureEither<List<PeriodPills>> getPeriodPills(int periodId) async {
    try {
      final response = await _dataSource.getPillsPeriod(periodId);
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
  FutureEither<AddPeriodData> setPeriodWeight(
      PeriodWeightRequest request) async {
    try {
      final body = request.toJson();
      final response = await _dataSource.setWeightPeriod(body);
      return right(response.toEntity());
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
  FutureEither<List<PeriodWeight>> getPeriodWeight(int periodId) async {
    try {
      final response = await _dataSource.getWeightPeriod(periodId);
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
  FutureEither<AddPeriodData> setPeriodMood(PeriodMoodRequest request) async {
    try {
      final body = request.toJson();
      final response = await _dataSource.setMoodPeriod(body);
      return right(response.toEntity());
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
  FutureEither<List<PeriodSymptom>> getPeriodSymptom(int periodId) async {
    try {
      final response = await _dataSource.getSymptomPeriod(periodId);
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
  FutureEither<List<Symptom>> getSymptom() async {
    try {
      final response = await _dataSource.getSymptom();
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
  FutureEither<AddPeriodData> setPeriodSymptom(
      PeriodSymptomRequest request) async {
    try {
      final body = request.toJson();
      final response = await _dataSource.setSymptomPeriod(body);
      return right(response.toEntity());
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
