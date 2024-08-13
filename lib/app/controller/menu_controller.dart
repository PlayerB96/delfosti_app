import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puntossmart_usuarios/app/routes/pages.dart';

class MenuzController extends GetxController {
  final colorAnio = true.obs;
  final colorMes = true.obs;
  final colorDia = true.obs;

  @override
  void onReady() {
    super.onReady();
  }

  RxList<BottomNavigationBarItem> listBottom =
      RxList<BottomNavigationBarItem>(const [
    BottomNavigationBarItem(
      icon: Icon(Icons.apps),
      label: 'Informes',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.summarize),
      label: 'Sumatoria',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Configuraciones',
    ),
  ]);

  RxInt indexT = RxInt(0);

  List<String> listPages = [
    Routes.DASHBOARD,
    Routes.DASHBOARD,
    Routes.DASHBOARD
  ];

  void handleNavigationChange(int index) {
    print(index);
    print(listPages[index]);
    indexT.value = index;
    Get.offAllNamed(listPages[indexT.value]);
  }
}
