import 'package:delfosti_app/app/controller/categories_controller.dart';
import 'package:get/get.dart';

class CategoriesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriesController>(() => CategoriesController());
  }
}
