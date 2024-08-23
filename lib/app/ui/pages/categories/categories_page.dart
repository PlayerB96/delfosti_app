import 'dart:math'; // Importa el paquete para generar números aleatorios
import 'package:delfosti_app/app/controller/categories_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delfosti_app/app/controller/menu_controller.dart';
import 'package:delfosti_app/app/routes/pages.dart';
import 'package:delfosti_app/app/ui/global_widgets/drawer.dart';
import 'package:delfosti_app/app/ui/utils/style_utils.dart';

class CategoriesPage extends GetView<CategoriesController> {
  @override
  Widget build(BuildContext context) {
    final MenuzController menuCntl = Get.put(MenuzController());

    Color _generateRandomColor() {
      final random = Random();
      return Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    }

    return GetBuilder<CategoriesController>(
      builder: (clientsCntl) {
        return Scaffold(
          drawer: drawer(
              nameConductor: 'Delfosti', phoneConductor: 'delfosti@gmail.com'),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: BACKGROUND,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      pathPerson,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              ],
            ),
          ),
          body: WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(Routes
                  .LOGIN); // Navega a la ruta de login al presionar el botón de retroceso
              return false;
            },
            child: SafeArea(
              child: Container(
                color: BACKGROUND,
                constraints: const BoxConstraints.expand(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Lista horizontal de categorías
                    Container(
                      height: 100, // Altura del slide
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal, // Scroll horizontal
                        itemCount: clientsCntl
                            .filteredMoviesList.length, // Número de categorías
                        itemBuilder: (context, index) {
                          return Container(
                            width: 100, // Ancho de cada categoría
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: _generateRandomColor(), // Color aleatorio
                              borderRadius: BorderRadius.circular(
                                  10), // Bordes redondeados
                            ),
                            child: Center(
                              child: Text(
                                clientsCntl.filteredMoviesList[index]
                                    .title, // Texto de la categoría
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Dropdown para filtrar por género
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: DropdownButton<String>(
                          value: clientsCntl.selectedGenre.value.isNotEmpty
                              ? clientsCntl.selectedGenre.value
                              : null, // Manejar el estado inicial
                          onChanged: (newValue) {
                            if (newValue != null) {
                              clientsCntl.selectedGenre.value = newValue;
                              clientsCntl
                                  .updateFilteredMovies(); // Actualizar la lista filtrada
                            }
                          },
                          items: clientsCntl.genres
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )),

                    // Lista vertical de películas filtradas
                    Expanded(
                      child: ListView.builder(
                        itemCount: clientsCntl.filteredMoviesList.length,
                        itemBuilder: (context, index) {
                          final movie = clientsCntl.filteredMoviesList[index];
                          return ListTile(
                            title: Text(movie.title),
                            subtitle: Text(movie.description),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              currentIndex: menuCntl.indexT.value,
              onTap: menuCntl.handleNavigationChange,
              items: menuCntl.listBottom,
            ),
          ),
        );
      },
    );
  }
}
