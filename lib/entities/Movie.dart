import 'package:json_annotation/json_annotation.dart';
part 'Movie.g.dart';

@JsonSerializable()
class Movie{

  String id;
  String title;
  String director;
  String summary;
  Set<String> genres;

  Movie({
    this.id = '',
    this.title = '',
    this.director = '',
    this.summary = '',
    this.genres = const {},
});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  Movie clone(){
    return Movie.fromJson(toJson());
  }

}