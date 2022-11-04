import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/movie.dart';

class SingleMovieController extends FxController {
  final Movie movie;

  SingleMovieController(this.movie);

  bool showLoading = true, uiLoading = true;

  @override
  initState() {
    super.initState();
    super.save = false;
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    showLoading = false;
    uiLoading = false;
    update();
  }

  void goBack() {
    Navigator.pop(context);
  }

  @override
  String getTag() {
    return "single_movie_controller";
  }
}
