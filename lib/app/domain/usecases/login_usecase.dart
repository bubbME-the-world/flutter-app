import '../../data/model/requests/login_request.dart';
import '../../utils/type_defs.dart';
import '../entity/token.dart';
import '../repositories/authentication_repository.dart';

class LoginUseCase {
  final AuthenticationRepository repository;

  LoginUseCase(this.repository);

  FutureEither<Token> execute(LoginRequest request) {
    return repository.login(request);
  }
}
