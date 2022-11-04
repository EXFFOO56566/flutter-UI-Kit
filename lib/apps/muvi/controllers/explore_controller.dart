import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/movie.dart';
import '../views/single_movie_screen.dart';

class ExploreController extends FxController {
  bool showLoading = true, uiLoading = true;
  String selectedCategory = "Action";
  List<String> categories = [
    "Action",
    "Comedy",
    "Kids",
    "Thriller",
    "Suspense",
    "Drama",
    "Horror",
    "Fantasy",
    "Romance",
    "Mystery",
  ];
  List<Movie>? movies;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    movies = await Movie.getDummyList();
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToSingleMovieScreen(Movie movie) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SingleMovieScreen(movie)));
  }

  double findAspectRatio() {
    double width = MediaQuery.of(context).size.width;
    return ((width - 60) / 2) / (250);
  }

  void selectCategory(String category) {
    selectedCategory = category;
    update();
  }

  @override
  String getTag() {
    return "explore_controller";
  }
}
