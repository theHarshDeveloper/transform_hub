import 'package:mobx/mobx.dart';
import 'package:transform_hub/movies/Movie.dart';

part 'MoviesRepo.g.dart';

class MoviesRepo = _MoviesRepo with _$MoviesRepo;

abstract class _MoviesRepo with Store {
  @observable
  List<Movie> movies = [];

  @action
  addMovie(Movie newMovie) {
    List<Movie> l = movies;
    l.add(newMovie);
    movies = l;
  }

  @action
  updateMovie(Movie newMovie, int index) {
    movies[index] = newMovie;
  }

  @action
  deleteMovie(Movie newMovie) {
    movies.remove(newMovie);
  }
}
