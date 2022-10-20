import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:transform_hub/AppTheme.dart';
import 'package:transform_hub/entities/Movie.dart';
import 'package:transform_hub/movies/MoviesLocator.dart';
import 'package:transform_hub/movies/MoviesRepo.dart';
import 'package:transform_hub/util/StringExtension.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AddMovieScreen extends StatefulWidget {
  final Movie? movie;

  const AddMovieScreen({Key? key, this.movie}) : super(key: key);

  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  late final Movie _newMovie;
  final MoviesRepo _moviesRepo = moviesLocator.get<MoviesRepo>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _directorController = TextEditingController();
  final TextEditingController _summaryController = TextEditingController();

  final FocusNode _genreNode = FocusNode(), _directorNode = FocusNode(), _summaryNode = FocusNode();

  @override
  void initState() {
    _newMovie = widget.movie ?? Movie(genres: {});

    _titleController.text = _newMovie.title;
    _directorController.text = _newMovie.director;
    _summaryController.text = _newMovie.summary;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Movie"),
        automaticallyImplyLeading: !kIsWeb,
      ),
      floatingActionButton: showFab
          ? FloatingActionButton(
              child: const Icon(Icons.save),
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;

                if (widget.movie == null) {
                  _moviesRepo.addMovie(_newMovie);
                  AutoRouter.of(context).pop();
                } else {
                  _moviesRepo.updateMovie(_newMovie);
                  AutoRouter.of(context).pop(_newMovie);
                }
              },
            )
          : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 12),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Movie Title',
                    border: AppTheme.tf_outline,
                  ),
                  onChanged: (str) {
                    _newMovie.title = str.toCamelCase;
                  },
                  maxLines: 1,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter(RegExp("[a-zA-Z0-9 ]"), allow: true),
                  ],
                  validator: (str) {
                    return (str == null || str.isEmpty) ? "Title is required" : null;
                  },
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (str) {
                    _directorNode.requestFocus();
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _directorController,
                  decoration: InputDecoration(
                    hintText: 'Director',
                    border: AppTheme.tf_outline,
                  ),
                  onChanged: (str) {
                    _newMovie.director = str.toCamelCase;
                  },
                  maxLines: 1,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter(RegExp("[a-zA-Z ]"), allow: true),
                  ],
                  validator: (str) {
                    return (str == null || str.isEmpty) ? "Director is required" : null;
                  },
                  focusNode: _directorNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (str) {
                    _summaryNode.requestFocus();
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _summaryController,
                  decoration: InputDecoration(
                    hintText: 'Summary',
                    border: AppTheme.tf_outline,
                  ),
                  onChanged: (str) {
                    _newMovie.summary = str.inCaps;
                  },
                  maxLines: 4,
                  textAlignVertical: TextAlignVertical.top,
                  validator: (str) {
                    return (str == null || str.isEmpty) ? "Summary is required" : null;
                  },
                  focusNode: _summaryNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (str) {
                    _genreNode.requestFocus();
                  },
                ),
                const SizedBox(height: 12),
                _genresView()
              ],
            ),
          ),
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
          if (kIsWeb) const SizedBox(height: 10),
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
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
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
    TextEditingController txtController = TextEditingController();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            controller: txtController,
            decoration: InputDecoration(
              hintText: 'Genre',
              border: AppTheme.tf_outline,
            ),
            onChanged: (str) {
              genre = str;
            },
            maxLines: 1,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter(RegExp("[a-zA-Z ]"), allow: true),
            ],
            validator: (str) {
              return (_newMovie.genres.isEmpty) ? "Genres are required" : null;
            },
            focusNode: _genreNode,
            textInputAction: TextInputAction.go,
            onFieldSubmitted: (str) {
              _onAddGenre(genre, txtController);
            },
          ),
        ),
        const SizedBox(width: 8),
        MaterialButton(
          color: Theme.of(context).primaryColor,
          height: 50,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          onPressed: () {
            _onAddGenre(genre, txtController);
          },
          child: const Text('Add Genre'),
        )
      ],
    );
  }

  void _onAddGenre(String genre, TextEditingController txtController) {
    if (genre.isEmpty) return;
    setState(() {
      _newMovie.genres.add(genre.toCamelCase);
      txtController.text = '';
      _genreNode.requestFocus();
    });
  }
}
