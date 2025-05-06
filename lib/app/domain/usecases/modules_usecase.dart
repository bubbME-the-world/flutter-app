import '../../utils/type_defs.dart';
import '../entity/module.dart';
import '../repositories/module_repository.dart';

class ModulesUseCase {
  final ModuleRepository repository;

  ModulesUseCase(this.repository);

  FutureEither<List<Module>> execute() {
    return repository.getModules();
  }
}
