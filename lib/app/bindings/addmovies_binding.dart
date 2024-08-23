import 'package:delfosti_app/app/controller/addmovies_controller.dart';
import 'package:get/get.dart';

class AddMoviesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMoviesController>(() => AddMoviesController());
  }
}
