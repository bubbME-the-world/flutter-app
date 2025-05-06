import '../../data/model/requests/login_email_request.dart';
import '../../data/model/requests/login_request.dart';
import '../../data/model/requests/otp_request.dart';
import '../../data/model/requests/regis_email_request.dart';
import '../../data/model/requests/regis_request.dart';
import '../../utils/type_defs.dart';
import '../entity/token.dart';

abstract class AuthenticationRepository {
  FutureEither<Token> login(LoginRequest request);

  FutureEither<Token> loginEmail(LoginEmailRequest request);

  FutureEither<Token> regis(RegisRequest request);

  FutureEither<Token> regisEmail(RegisEmailRequest request);

  FutureEither<Token> verifyOTP(OTPRequest request);
}
