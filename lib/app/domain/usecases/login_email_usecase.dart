import '../../data/model/requests/login_email_request.dart';
import '../../utils/type_defs.dart';
import '../entity/token.dart';
import '../repositories/authentication_repository.dart';

class LoginEmailUseCase {
  final AuthenticationRepository repository;

  LoginEmailUseCase(this.repository);

  FutureEither<Token> execute(LoginEmailRequest request) {
    return repository.loginEmail(request);
  }
}
