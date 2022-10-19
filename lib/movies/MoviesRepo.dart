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
    newMovie.id = movies.length.toString();
    l.add(newMovie);
    movies = l;
  }

  @action
  updateMovie(Movie newMovie) {
    List<Movie> l = movies;
    int i = l.indexWhere((element) => element.id == newMovie.id);
    l[i] = newMovie;
    movies = l;
  }

  @action
  deleteMovie(Movie newMovie) {
    List<Movie> l = movies;
    l.remove(newMovie);
    movies = l;
  }
}
