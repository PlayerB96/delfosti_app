import 'package:delfosti_app/app/data/model/movies/movies_data.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CategoriesController extends GetxController {
  RxList<MoviesData> moviesList = <MoviesData>[].obs;
  RxList<MoviesData> filteredMoviesList = <MoviesData>[].obs;
  RxString selectedGenre = 'All'.obs;

  List<String> genres = [
    'All',
    'Crime',
    'Drama',
    'Action',
  ];

  @override
  void onReady() {
    super.onReady();
    loadMovies();
  }

  void loadMovies() {
    final box = GetStorage();
    List<dynamic> storedMovies = box.read('moviesList') ?? [];

    moviesList.value =
        storedMovies.map((movie) => MoviesData.fromJson(movie)).toList();
    // Actualiza la lista filtrada según el género seleccionado por defecto ('Todos')
    updateFilteredMovies();
  }

  void updateFilteredMovies() {
    if (selectedGenre.value == 'All') {
      filteredMoviesList.value = moviesList;
    } else {
      filteredMoviesList.value = moviesList
          .where((movie) => movie.genre == selectedGenre.value)
          .toList();
    }
    update();
  }
}
