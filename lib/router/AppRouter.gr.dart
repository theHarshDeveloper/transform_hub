// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:transform_hub/movies/AddMovieScreen.dart' as _i2;
import 'package:transform_hub/movies/Movie.dart' as _i6;
import 'package:transform_hub/movies/MovieDetailsScreen.dart' as _i3;
import 'package:transform_hub/movies/MovieListScreen.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MovieListRoute.name: (routeData) {
      final args = routeData.argsAs<MovieListRouteArgs>(
          orElse: () => const MovieListRouteArgs());
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.MovieListScreen(key: args.key),
      );
    },
    AddMovieRoute.name: (routeData) {
      final args = routeData.argsAs<AddMovieRouteArgs>(
          orElse: () => const AddMovieRouteArgs());
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.AddMovieScreen(
          key: args.key,
          movie: args.movie,
        ),
      );
    },
    MovieDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailsRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.MovieDetailsScreen(
          key: args.key,
          movie: args.movie,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          MovieListRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          AddMovieRoute.name,
          path: '/add-movie',
        ),
        _i4.RouteConfig(
          MovieDetailsRoute.name,
          path: '/movie-detail',
        ),
      ];
}

/// generated route for
/// [_i1.MovieListScreen]
class MovieListRoute extends _i4.PageRouteInfo<MovieListRouteArgs> {
  MovieListRoute({_i5.Key? key})
      : super(
          MovieListRoute.name,
          path: '/',
          args: MovieListRouteArgs(key: key),
        );

  static const String name = 'MovieListRoute';
}

class MovieListRouteArgs {
  const MovieListRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'MovieListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.AddMovieScreen]
class AddMovieRoute extends _i4.PageRouteInfo<AddMovieRouteArgs> {
  AddMovieRoute({
    _i5.Key? key,
    _i6.Movie? movie,
  }) : super(
          AddMovieRoute.name,
          path: '/add-movie',
          args: AddMovieRouteArgs(
            key: key,
            movie: movie,
          ),
        );

  static const String name = 'AddMovieRoute';
}

class AddMovieRouteArgs {
  const AddMovieRouteArgs({
    this.key,
    this.movie,
  });

  final _i5.Key? key;

  final _i6.Movie? movie;

  @override
  String toString() {
    return 'AddMovieRouteArgs{key: $key, movie: $movie}';
  }
}

/// generated route for
/// [_i3.MovieDetailsScreen]
class MovieDetailsRoute extends _i4.PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    _i5.Key? key,
    required _i6.Movie movie,
  }) : super(
          MovieDetailsRoute.name,
          path: '/movie-detail',
          args: MovieDetailsRouteArgs(
            key: key,
            movie: movie,
          ),
        );

  static const String name = 'MovieDetailsRoute';
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({
    this.key,
    required this.movie,
  });

  final _i5.Key? key;

  final _i6.Movie movie;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movie: $movie}';
  }
}
