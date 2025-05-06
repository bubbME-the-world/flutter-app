import '../entity/profile.dart';
import '../repositories/user_repository.dart';

class ProfileLocalUseCase {
  final UserRepository repository;

  ProfileLocalUseCase(this.repository);

  Future<Profile?> execute() {
    return repository.getProfileLocal();
  }
}
