// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MoviesRepo.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MoviesRepo on _MoviesRepo, Store {
  late final _$moviesAtom = Atom(name: '_MoviesRepo.movies', context: context);

  @override
  List<Movie> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(List<Movie> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$_MoviesRepoActionController =
      ActionController(name: '_MoviesRepo', context: context);

  @override
  dynamic addMovie(Movie newMovie) {
    final _$actionInfo =
        _$_MoviesRepoActionController.startAction(name: '_MoviesRepo.addMovie');
    try {
      return super.addMovie(newMovie);
    } finally {
      _$_MoviesRepoActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateMovie(Movie newMovie) {
    final _$actionInfo = _$_MoviesRepoActionController.startAction(
        name: '_MoviesRepo.updateMovie');
    try {
      return super.updateMovie(newMovie);
    } finally {
      _$_MoviesRepoActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteMovie(Movie newMovie) {
    final _$actionInfo = _$_MoviesRepoActionController.startAction(
        name: '_MoviesRepo.deleteMovie');
    try {
      return super.deleteMovie(newMovie);
    } finally {
      _$_MoviesRepoActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies}
    ''';
  }
}
