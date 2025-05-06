import '../../utils/type_defs.dart';
import '../entity/level.dart';
import '../repositories/module_repository.dart';

class NodesUseCase {
  final ModuleRepository repository;

  NodesUseCase(this.repository);

  FutureEither<List<Level>> execute(int moduleId) {
    return repository.getLevels(moduleId);
  }
}
