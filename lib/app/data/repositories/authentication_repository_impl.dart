import 'package:bubbme/app/data/model/requests/otp_request.dart';
import 'package:bubbme/app/data/model/requests/regis_email_request.dart';
import 'package:bubbme/app/data/model/requests/regis_request.dart';
import 'package:bubbme/app/data/model/responses/failure_response.dart';
import 'package:dartz/dartz.dart';

import '../../core/service/network_exceptions.dart';
import '../../domain/entity/token.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../../utils/type_defs.dart';
import '../datasource/authentication_data_source.dart';
import '../model/requests/login_email_request.dart';
import '../model/requests/login_request.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationDataSource _dataSource;

  AuthenticationRepositoryImpl({
    required AuthenticationDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  FutureEither<Token> login(LoginRequest request) async {
    try {
      final body = request.toJson();
      final response = await _dataSource.login(body);
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
  FutureEither<Token> loginEmail(LoginEmailRequest request) async {
    try {
      final body = request.toJson();
      final response = await _dataSource.loginEmail(body);
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
  FutureEither<Token> regis(RegisRequest request) async {
    try {
      final body = request.toJson();
      final response = await _dataSource.regis(body);
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
  FutureEither<Token> regisEmail(RegisEmailRequest request) async {
    try {
      final body = request.toJson();
      final response = await _dataSource.regisEmail(body);
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
  FutureEither<Token> verifyOTP(OTPRequest request) async {
    try {
      final body = request.toJson();
      final response = await _dataSource.verifyOTP(body);
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
