import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:transform_hub/movies/MovieListScreen.dart';
import 'package:transform_hub/movies/MoviesLocator.dart';
import 'package:transform_hub/router/AppRouter.gr.dart';

void main() {
  setup();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.orange,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
      ),
    );
  }
}
