import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transform_hub/entities/Movie.dart';

class MovieGeneresWidget extends StatelessWidget {
  final Movie movie;
  final int displayMax;
  const MovieGeneresWidget({Key? key, required this.movie, this. displayMax = -1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 2,
      spacing: 6,
      alignment: WrapAlignment.end,
      children: movie.genres.take(displayMax > 0 ? displayMax : movie.genres.length).map((e) => _genreItem(e, context)).toList(),
    );
  }

  Widget _genreItem(String genre, BuildContext context) {
    return Chip(
      label: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(genre),
      ),
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
    );
  }

}
