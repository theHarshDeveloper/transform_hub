import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:transform_hub/movies/MovieListScreen.dart';
import 'package:transform_hub/movies/MoviesLocator.dart';

void main() {
  setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.orange, secondaryHeaderColor: Colors.deepPurple),
      home: MovieListScreen(),
    );
  }
}
