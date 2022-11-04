import 'dart:convert';

import 'package:flutter/services.dart';

class Movie {
  String name, image, production, description, director, writer;
  double ratings;
  List<String> cast;

  Movie(this.name, this.image, this.production, this.description, this.director,
      this.writer, this.ratings, this.cast);

  static Future<List<Movie>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Movie> getOne() async {
    return (await getDummyList())[0];
  }

  static Movie fromJson(Map<String, dynamic> jsonObject) {
    String name = jsonObject['name'].toString();
    String image = jsonObject['image'].toString();
    String production = jsonObject['production'].toString();
    String description = jsonObject['description'].toString();
    String director = jsonObject['director'].toString();
    String writer = jsonObject['writer'].toString();
    double ratings = double.parse(jsonObject['ratings'].toString());
    List<String> cast = [];
    for (int i = 0; i < jsonObject['cast'].length; i++) {
      cast.add(jsonObject['cast'][i].toString());
    }

    return Movie(
        name, image, production, description, director, writer, ratings, cast);
  }

  static List<Movie> getListFromJson(List<dynamic> jsonArray) {
    List<Movie> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(Movie.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/apps/muvi/data/movies.json');
  }
}
