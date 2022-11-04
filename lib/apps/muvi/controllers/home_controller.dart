import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/movie.dart';
import '../views/single_movie_screen.dart';
import '../views/subscription_screen.dart';

class HomeController extends FxController {
  bool showLoading = true, uiLoading = true;
  List<Movie>? movies;

  @override
  initState() {
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

  void goToSubscriptionScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SubscriptionScreen()));
  }

  @override
  String getTag() {
    return "home_controller";
  }
}
