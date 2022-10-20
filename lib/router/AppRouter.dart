import 'package:auto_route/annotations.dart';
import 'package:transform_hub/movies/AddMovieScreen.dart';
import 'package:transform_hub/movies/MovieDetailsScreen.dart';
import 'package:transform_hub/movies/MovieListScreen.dart';

// @CupertinoAutoRouter
@AdaptiveAutoRouter(
// @CustomAutoRouter
// @MaterialAutoRouter(
//   replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MovieListScreen, initial: true),
    AutoRoute(page: AddMovieScreen, path: "/add-movie"),
    AutoRoute(page: MovieDetailsScreen, path: "/movie-detail"),
  ],
  replaceInRouteName: 'Screen,Route'
)

class $AppRouter {}
