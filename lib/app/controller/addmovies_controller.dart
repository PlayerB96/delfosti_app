import 'package:delfosti_app/app/data/model/movies/movies_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddMoviesController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxString selectedGenre = 'All'.obs; // Genero por defecto

  List<String> genres = [
    'All',
    'Crime',
    'Drama',
    'Action',
  ];

  void addMovie() async {
    final box = GetStorage();
    List<dynamic> storedMovies = box.read('moviesList') ?? [];

    // Creacion de nueva peliucla
    final newMovie = MoviesData(
      id: storedMovies.length + 1, // generar nuevo id
      title: titleController.text,
      description: descriptionController.text,
      genre: selectedGenre.value,
    );

    storedMovies.add(newMovie.toJson());
    await box.write('moviesList', storedMovies);

    titleController.clear();
    descriptionController.clear();
    selectedGenre.value = 'All';

    // Get.back();
    Get.snackbar('Agregado', 'Película añadida correctamente');
  }
}
