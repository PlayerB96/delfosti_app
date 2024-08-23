import 'package:delfosti_app/app/data/model/movies/movies_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delfosti_app/app/controller/menu_controller.dart';
import 'package:delfosti_app/app/controller/home_controller.dart';
import 'package:delfosti_app/app/routes/pages.dart';
import 'package:delfosti_app/app/ui/global_widgets/drawer.dart';
import 'package:delfosti_app/app/ui/utils/style_utils.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final MenuzController menuCntl = Get.put(MenuzController());
    final TextEditingController searchController = TextEditingController();
    String searchTerm = "";

    return GetBuilder<HomeController>(
      builder: (clientsCntl) {
        // Buscar por titulo
        List<MoviesData> filteredMovies = clientsCntl.moviesList.where((movie) {
          final titleMatch =
              movie.title.toLowerCase().contains(searchTerm.toLowerCase());
          final descriptionMatch = movie.description
              .toLowerCase()
              .contains(searchTerm.toLowerCase());
          final genreMatch =
              movie.genre.toLowerCase().contains(searchTerm.toLowerCase());
          return titleMatch || descriptionMatch || genreMatch;
        }).toList();

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
              Get.offAndToNamed(Routes.LOGIN);
              return false;
            },
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        labelText: 'Buscar Película',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        searchTerm = value;
                        clientsCntl.update(); // Update the UI
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: BACKGROUND,
                      constraints: const BoxConstraints.expand(),
                      child: ListView.builder(
                        itemCount: filteredMovies.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                filteredMovies[index]
                                    .title, // Título de la película
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    filteredMovies[index]
                                        .description, // Descripción de la película
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Genre: ${filteredMovies[index].genre}', // Género de la película
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.thumb_up,
                                          color: filteredMovies[index]
                                                  .isLiked
                                                  .value
                                              ? Colors.blue
                                              : Colors.grey,
                                        ),
                                        onPressed: () {
                                          filteredMovies[index].isLiked.value =
                                              !filteredMovies[index]
                                                  .isLiked
                                                  .value;
                                          if (filteredMovies[index]
                                              .isLiked
                                              .value) {
                                            filteredMovies[index]
                                                .isDisliked
                                                .value = false;
                                          }
                                          clientsCntl.update(); // Update the UI
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.thumb_down,
                                          color: filteredMovies[index]
                                                  .isDisliked
                                                  .value
                                              ? Colors.red
                                              : Colors.grey,
                                        ),
                                        onPressed: () {
                                          filteredMovies[index]
                                                  .isDisliked
                                                  .value =
                                              !filteredMovies[index]
                                                  .isDisliked
                                                  .value;
                                          if (filteredMovies[index]
                                              .isDisliked
                                              .value) {
                                            filteredMovies[index]
                                                .isLiked
                                                .value = false;
                                          }
                                          clientsCntl.update(); // Update the UI
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              isThreeLine: true,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
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
