import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delfosti_app/app/routes/pages.dart';

class MenuzController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  RxList<BottomNavigationBarItem> listBottom =
      RxList<BottomNavigationBarItem>(const [
    BottomNavigationBarItem(
      icon: Icon(Icons.apps),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.movie),
      label: 'Categorías',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add),
      label: 'Agregar',
    ),
  ]);

  RxInt indexT = 0.obs;

  List<String> listPages = [
    Routes.DASHBOARD,
    Routes.CATEGORIES,
    Routes.ADDMOVIES
  ];

  void handleNavigationChange(int index) {
    if (index != indexT.value) {
      indexT.value = index;
      Get.offAndToNamed(listPages[index]);
    }
  }
}
