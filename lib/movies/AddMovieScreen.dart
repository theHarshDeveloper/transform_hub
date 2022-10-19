import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transform_hub/AppTheme.dart';
import 'package:transform_hub/movies/Movie.dart';
import 'package:transform_hub/movies/MoviesLocator.dart';
import 'package:transform_hub/movies/MoviesRepo.dart';
import 'package:transform_hub/util/StringExtension.dart';

class AddMovieScreen extends StatefulWidget {
  AddMovieScreen({Key? key}) : super(key: key);

  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  final Movie _newMovie = Movie(genres: {});

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                hintText: 'Movie Title',
                border: AppTheme.tf_outline,
              ),
              onChanged: (str) {
                _newMovie.title = str;
              },
              maxLines: 1,
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                hintText: 'Director',
                border: AppTheme.tf_outline,
              ),
              onChanged: (str) {
                _newMovie.director = str;
              },
              maxLines: 1,
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                hintText: 'Summary',
                border: AppTheme.tf_outline,
              ),
              onChanged: (str) {
                _newMovie.summary = str;
              },
              maxLines: 4,
            ),
            const SizedBox(height: 12),
            _genresView()
          ],
        ),
      ),
    );
  }

  _genresView() {
    return StatefulBuilder(
      builder: (bc, setState) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _addGenreItem(setState),
          Wrap(
            runSpacing: 6,
            spacing: 6,
            alignment: WrapAlignment.start,
            children: _newMovie.genres.map((e) => _genreItem(e, setState)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _genreItem(String genre, StateSetter setState) {
    return Chip(
      label: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(genre),
      ),
      backgroundColor: Colors.orange.withOpacity(0.5),
      deleteIcon: Container(
          padding: EdgeInsets.all(4),
          child: Icon(
            Icons.close,
            size: 16,
          )),
      onDeleted: () {
        setState(() {
          _newMovie.genres.remove(genre);
        });
      },
    );
  }

  _addGenreItem(StateSetter setState) {
    String genre = '';
    TextEditingController _txtController = TextEditingController();
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _txtController,
            decoration: InputDecoration(
              hintText: 'Genre',
              border: AppTheme.tf_outline,
            ),
            onChanged: (str) {
              genre = str;
            },
            maxLines: 1,
          ),
        ),
        const SizedBox(width: 8),
        MaterialButton(
          child: Text('Add Genre'),
          color: Colors.orange,
          height: 50,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          onPressed: () {
            if (genre.isEmpty) return;
            setState(() {
              _newMovie.genres.add(genre.toCamelCase);
              _txtController.text = '';
            });
          },
        )
      ],
    );
  }
}
