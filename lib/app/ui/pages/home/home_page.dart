// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:puntossmart_usuarios/app/controller/menu_controller.dart';
import 'package:puntossmart_usuarios/app/controller/home_controller.dart';
import 'package:puntossmart_usuarios/app/routes/pages.dart';
import 'package:puntossmart_usuarios/app/ui/global_widgets/drawer.dart';
import 'package:puntossmart_usuarios/app/ui/utils/style_utils.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final MenuzController menuCntl = Get.put(MenuzController());
    List<String> categories = [
      'Electronics',
      'Clothing',
      'Home & Kitchen',
      'Books',
      'Toys',
      'Sports',
      'Health & Beauty',
    ];
    return GetBuilder<HomeController>(
      builder: (clientsCntl) {
        return Scaffold(
          drawer: drawer(
              nameConductor: 'Tony Jaxx',
              phoneConductor: 'info@puntossmart.com'),
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
              child: Container(
                color: BACKGROUND,
                constraints: const BoxConstraints.expand(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100, // Altura del slide
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal, // Scroll horizontal
                        itemCount: categories.length, // Número de categorías
                        itemBuilder: (context, index) {
                          return Container(
                            width: 100, // Ancho de cada categoría
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: Colors
                                  .white, // Color de fondo de la categoría
                              borderRadius: BorderRadius.circular(
                                  10), // Bordes redondeados
                            ),
                            child: Center(
                              child: Text(
                                categories[index], // Texto de la categoría
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                        height: 10), // Espaciado entre el slide y el contenido
                    Expanded(
                      child: Container(
                        color: BACKGROUND,
                        constraints: const BoxConstraints.expand(),
                        child: Obx(
                          () => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: clientsCntl.itemsUnits.value.isNotEmpty
                                    ? Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        constraints:
                                            const BoxConstraints.expand(),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children:
                                                clientsCntl.itemsUnits.value,
                                          ),
                                        ),
                                      )
                                    : const Text('Pendiente..'),
                              ),
                              const SizedBox(height: 10.0),
                            ],
                          ),
                        ),
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
