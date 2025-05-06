import '../../utils/type_defs.dart';
import '../entity/profile.dart';
import '../repositories/user_repository.dart';

class ProfileUseCase {
  final UserRepository repository;

  ProfileUseCase(this.repository);

  FutureEither<Profile> execute() {
    return repository.getProfile();
  }
}
