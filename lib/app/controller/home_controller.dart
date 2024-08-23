import 'package:delfosti_app/app/data/model/movies/movies_data.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  List<MoviesData> moviesList = [];

  @override
  void onInit() {
    super.onInit();
    loadMovies();
  }

  void loadMovies() {
    final box = GetStorage();
    List<dynamic> storedMoviesJson = box.read('moviesList') ?? [];

    moviesList = storedMoviesJson
        .map((movieJson) => MoviesData.fromJson(movieJson))
        .toList();

    update(); // Asegúrate de actualizar la UI
  }
}
