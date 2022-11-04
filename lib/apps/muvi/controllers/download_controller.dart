import 'package:flutx/flutx.dart';

import '../models/download_movie.dart';

class DownloadController extends FxController {
  bool showLoading = true, uiLoading = true;
  List<DownloadMovie>? downloadMovies;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    downloadMovies = await DownloadMovie.getDummyList();
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  @override
  String getTag() {
    return "download_controller";
  }
}
