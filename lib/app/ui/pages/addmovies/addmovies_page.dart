import 'package:delfosti_app/app/controller/addmovies_controller.dart';
import 'package:delfosti_app/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMoviesPage extends GetView<AddMoviesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir Películas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAndToNamed(Routes.DASHBOARD); // Navega a la ruta deseada
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: controller.titleController,
                decoration:
                    const InputDecoration(labelText: 'Título de película'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.descriptionController,
                decoration:
                    const InputDecoration(labelText: 'Descripción de película'),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: controller.selectedGenre.value,
                onChanged: (String? newValue) {
                  controller.selectedGenre.value = newValue!;
                },
                items: controller.genres.map((String genre) {
                  return DropdownMenuItem<String>(
                    value: genre,
                    child: Text(genre),
                  );
                }).toList(),
                decoration:
                    const InputDecoration(labelText: 'Género de película'),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  controller.addMovie();
                },
                child: const Text('Agregar Película'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
