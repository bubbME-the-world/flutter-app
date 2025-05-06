import '../../data/model/requests/regis_request.dart';
import '../../utils/type_defs.dart';
import '../entity/token.dart';
import '../repositories/authentication_repository.dart';

class RegisUseCase {
  final AuthenticationRepository repository;

  RegisUseCase(this.repository);

  FutureEither<Token> execute(RegisRequest request) {
    return repository.regis(request);
  }
}
