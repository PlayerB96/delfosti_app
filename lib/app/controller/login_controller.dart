import 'package:delfosti_app/app/data/model/movies/movies_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:delfosti_app/app/controller/menu_controller.dart';
import 'package:delfosti_app/app/data/repository/login_repository.dart';
import 'package:delfosti_app/app/routes/pages.dart';

class LoginController extends GetxController {
  final LoginRepository loginRepository = LoginRepository();
  final MenuzController menuController = MenuzController();
  RxBool obscurePass = RxBool(true);

  TextEditingController userCtll = TextEditingController(text: "");
  TextEditingController passCtll = TextEditingController(text: "");

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getCred() async {
    final box = GetStorage();
    List<MoviesData> moviesList = [
      MoviesData(
        id: 1,
        title: 'The Shawshank Redemption',
        description:
            'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
        genre: 'Drama',
      ),
      MoviesData(
        id: 2,
        title: 'Inception',
        description:
            'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O',
        genre: 'Action',
      ),
      MoviesData(
        id: 3,
        title: 'The Dark Knight',
        description:
            'Whe the menace known as The Joker emerges from his mysterious past, he wreaks havoc and chaos on the people Gotham',
        genre: 'Action',
      ),
      MoviesData(
        id: 4,
        title: 'Pulp Fiction',
        description:
            'The lives of two mob hitmen, a boxer, a gangsters wife , and a pair of diner bandits intertwine in four tales of violence and redemption. ',
        genre: 'Crime',
      ),
      MoviesData(
        id: 5,
        title: 'The Godfather',
        description:
            'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.',
        genre: 'Crime',
      ),
      MoviesData(
        id: 6,
        title: 'Fight Club',
        description:
            'An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.',
        genre: 'Drama',
      ),
    ];

    // Convertir la lista de MoviesData a JSON y almacenarla
    List<Map<String, dynamic>> moviesJson =
        moviesList.map((movie) => movie.toJson()).toList();

    // Escribir los datos y esperar a que termine
    await box.write('moviesList', moviesJson);
    print("Movies list stored: $moviesJson");

    // Navegar después de asegurarse de que los datos están escritos
    Get.toNamed(Routes.DASHBOARD);
  }
}
