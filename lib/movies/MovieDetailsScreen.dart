import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transform_hub/movies/Movie.dart';
import 'package:transform_hub/movies/MoviesLocator.dart';
import 'package:transform_hub/movies/MoviesRepo.dart';

class MovieDetailsScreen extends StatelessWidget {
  MovieDetailsScreen({Key? key}) : super(key: key);
  final Movie _newMovie = Movie();
  final MoviesRepo _moviesRepo = moviesLocator.get<MoviesRepo>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Movie"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          _moviesRepo.addMovie(_newMovie);
          Navigator.pop(context, _newMovie);
        },
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (str){
              _newMovie.title = str;
            },
            maxLines: 1,
          )
        ],
      ),
    );
  }
}
