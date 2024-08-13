import 'package:get/get.dart';
import 'package:puntossmart_usuarios/app/controller/menu_controller.dart';

class MenuBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MenuzController>(MenuzController(), tag: 'menucntl');
  }
}
