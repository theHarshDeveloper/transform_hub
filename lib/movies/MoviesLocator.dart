import 'package:get_it/get_it.dart';
import 'package:transform_hub/movies/MoviesRepo.dart';

final moviesLocator = GetIt.instance;

setup() {
  moviesLocator.registerSingleton<MoviesRepo>(MoviesRepo());
}
