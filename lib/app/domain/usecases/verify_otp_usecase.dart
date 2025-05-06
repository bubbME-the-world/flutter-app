import '../../data/model/requests/otp_request.dart';
import '../../utils/type_defs.dart';
import '../entity/token.dart';
import '../repositories/authentication_repository.dart';

class VerifyOTPUseCase {
  final AuthenticationRepository repository;

  VerifyOTPUseCase(this.repository);

  FutureEither<Token> execute(OTPRequest request) {
    return repository.verifyOTP(request);
  }
}
