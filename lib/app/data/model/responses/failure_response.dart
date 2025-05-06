import '../../../core/service/network_exceptions.dart';
import 'error_response.dart';

class FailureResponse {
  NetworkExceptions? error;
  ErrorResponse? errorRes;

  FailureResponse({
    this.error,
    this.errorRes,
  });
}
