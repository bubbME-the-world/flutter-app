import '../../utils/type_defs.dart';
import '../entity/slide.dart';
import '../repositories/module_repository.dart';

class SlidesUseCase {
  final ModuleRepository repository;

  SlidesUseCase(this.repository);

  FutureEither<List<Slide>> execute(int nodeId) {
    return repository.getSlides(nodeId);
  }
}
