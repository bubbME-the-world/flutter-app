import '../../utils/type_defs.dart';
import '../entity/profile.dart';

abstract class UserRepository {
  FutureEither<Profile> getProfile();

  Future<Profile?> getProfileLocal();
}
