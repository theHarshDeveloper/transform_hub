import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:transform_hub/movies/AddMovieScreen.dart';
import 'package:transform_hub/movies/Movie.dart';
import 'package:transform_hub/movies/MovieDetailsScreen.dart';
import 'package:transform_hub/movies/MovieGenresWidget.dart';
import 'package:transform_hub/movies/MoviesLocator.dart';
import 'package:transform_hub/movies/MoviesRepo.dart';

class MovieListScreen extends StatelessWidget {
  MovieListScreen({Key? key}) : super(key: key);

  final MoviesRepo _moviesRepo = moviesLocator.get<MoviesRepo>();

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: Observer(
        builder: (bc) {
          if (_moviesRepo.movies.isEmpty) {
            return const Center(
              child: Text(
                "No movies found.\nClick + to add new movies",
                textAlign: TextAlign.center,
              ),
            );
          }
          return MoviesListView(movies: _moviesRepo.movies);
        },
      ),
      floatingActionButton: showFab
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (bc) => AddMovieScreen()));
              },
            )
          : null,
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
        return MovieListItem(movie: movies[index]);
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

class MovieListItem extends StatelessWidget {
  final Movie movie;

  const MovieListItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        elevation: 4,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (bc) => MovieDetailsScreen(movie: movie)));
          },
          splashColor: Colors.white60,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  "By ${movie.director}",
                  style: TextStyle(fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                MovieGeneresWidget(movie: movie, displayMax: 5)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
