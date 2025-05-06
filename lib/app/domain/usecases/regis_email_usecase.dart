import '../../data/model/requests/regis_email_request.dart';
import '../../utils/type_defs.dart';
import '../entity/token.dart';
import '../repositories/authentication_repository.dart';

class RegisEmailUseCase {
  final AuthenticationRepository repository;

  RegisEmailUseCase(this.repository);

  FutureEither<Token> execute(RegisEmailRequest request) {
    return repository.regisEmail(request);
  }
}
