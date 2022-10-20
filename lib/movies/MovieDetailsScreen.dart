import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transform_hub/movies/AddMovieScreen.dart';
import 'package:transform_hub/movies/Movie.dart';
import 'package:transform_hub/movies/MovieGenresWidget.dart';
import 'package:transform_hub/movies/MoviesLocator.dart';
import 'package:transform_hub/movies/MoviesRepo.dart';
import 'package:transform_hub/router/AppRouter.gr.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late Movie movie;

  @override
  void initState() {
    movie = widget.movie;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        automaticallyImplyLeading: !kIsWeb,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_forever,
              size: 20,
            ),
            tooltip: 'Delete Movie',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (bc) => AlertDialog(
                        title: const Text("Are you sure you want to delete this movie?"),
                        actions: [
                          MaterialButton(
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                            onPressed: () {
                              AutoRouter.of(context).navigateBack();
                            },
                            child: Text(
                              'No',
                              style: TextStyle(color: Theme.of(context).primaryColor),
                            ),
                          ),
                          MaterialButton(
                            // height: 50,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                            onPressed: () {
                              moviesLocator.get<MoviesRepo>().deleteMovie(widget.movie);
                              Navigator.popUntil(context, ModalRoute.withName('MovieListRoute'));
                            },
                            child: Text(
                              'Yes',
                              style: TextStyle(color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ],
                      ));
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.edit,
              size: 20,
            ),
            tooltip: 'Edit Movie',
            onPressed: () async {
              dynamic result = await AutoRouter.of(context).push(AddMovieRoute(movie: widget.movie));

              // dynamic result = await Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (bc) => AddMovieScreen(movie: widget.movie),
              //   ),
              // );

              if (result != null) {
                setState(() {
                  movie = result;
                });
              }
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        child: Material(
          borderRadius: BorderRadius.circular(12),
          elevation: 4,
          child: InkWell(
            onTap: () {
              AutoRouter.of(context).push(MovieDetailsRoute(movie: widget.movie));
            },
            splashColor: Colors.white60,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.title,
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Directed By ${widget.movie.director}",
                    style: const TextStyle(fontSize: 20),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Summary",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    widget.movie.summary,
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 12),
                  MovieGeneresWidget(movie: widget.movie)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
