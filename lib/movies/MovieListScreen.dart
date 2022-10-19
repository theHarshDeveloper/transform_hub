import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:transform_hub/movies/AddMovieScreen.dart';
import 'package:transform_hub/movies/Movie.dart';
import 'package:transform_hub/movies/MoviesLocator.dart';
import 'package:transform_hub/movies/MoviesRepo.dart';

class MovieListScreen extends StatefulWidget {
  MovieListScreen({Key? key}) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  // final MoviesRepo _moviesRepo = MoviesRepo();
  final MoviesRepo _moviesRepo = moviesLocator.get<MoviesRepo>();

  @override
  void initState() {
    _moviesRepo.addMovie(Movie(title: "111111"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: Observer(
        builder: (bc) {
          return MoviesListView(movies: _moviesRepo.movies);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (bc) => AddMovieScreen()));
        },
      ),
    );
  }
}

class MoviesListView extends StatelessWidget {
  final List<Movie> movies;

  const MoviesListView({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      key: const ValueKey('adva'),
      itemCount: movies.length,
      itemBuilder: (bc, index) {
        return Container(
          margin: EdgeInsets.all(8),
          height: 40,
          child: Text(movies[index].title),
        );
      },
      separatorBuilder: (bc, index) {
        return Container(
          height: 1,
          color: Colors.orangeAccent.withOpacity(0.5),
        );
      },
    );
  }
}
