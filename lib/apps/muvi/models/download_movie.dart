import 'dart:convert';

import '../models/movie.dart';
import 'package:flutter/services.dart';

class DownloadMovie {
  Movie movie;
  double totalSize, downloadedSize;

  DownloadMovie(this.movie, this.totalSize, this.downloadedSize);

  static Future<List<DownloadMovie>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<DownloadMovie> getOne() async {
    return (await getDummyList())[0];
  }

  static DownloadMovie fromJson(Map<String, dynamic> jsonObject) {
    Movie movie = Movie.fromJson(jsonObject['movie']);
    double totalSize = double.parse(jsonObject['totalSize'].toString());
    double downloadedSize =
        double.parse(jsonObject['downloadedSize'].toString());

    return DownloadMovie(movie, totalSize, downloadedSize);
  }

  static List<DownloadMovie> getListFromJson(List<dynamic> jsonArray) {
    List<DownloadMovie> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(DownloadMovie.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle
        .loadString('lib/apps/muvi/data/download_movies.json');
  }
}
