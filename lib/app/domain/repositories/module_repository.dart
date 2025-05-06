import '../../utils/type_defs.dart';
import '../entity/module.dart';
import '../entity/level.dart';
import '../entity/slide.dart';

abstract class ModuleRepository {
  FutureEither<List<Module>> getModules();

  FutureEither<List<Level>> getLevels(int moduleId);

  FutureEither<List<Slide>> getSlides(int nodeId);
}
