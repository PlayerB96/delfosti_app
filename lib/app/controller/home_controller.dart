import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:puntossmart_usuarios/app/data/model/units/units.dart';
import 'package:puntossmart_usuarios/app/data/model/units/units_data.dart';
import 'package:puntossmart_usuarios/app/data/repository/home_repositoy.dart';
import 'package:puntossmart_usuarios/app/routes/pages.dart';
import 'package:puntossmart_usuarios/app/ui/utils/style_utils.dart';

class HomeController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    getUnits();

    super.onReady();
  }

  RxList<Widget> itemsUnits = <Widget>[].obs;
  HomeRepository unitsRepository = HomeRepository();
  Future<void> getUnits() async {
    final box = GetStorage();
    String token = box.read('token') ?? "";

    Units dt = await unitsRepository.getUnits(token: token);
    List<Widget> temp = [];

    for (UnitData item in dt.data) {
      temp.add(
        Column(children: [
          InkWell(
            onTap: () async {
              try {
                // await _ordersController.getOrders(
                //     codClient: item.codClient, roadmap: roadmap);
                final box = GetStorage();
                await box.write('plate', item.plate);
                await box.write('laps', item.laps);

                Get.offAllNamed(Routes.DASHBOARD);

                // Get.toNamed(Routes.ORDERS, parameters: data);
              } catch (e) {
                // Get.toNamed(Routes.ORDERS);
                EasyLoading.showInfo(e.toString());
              }
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // boxShadow: [BoxShadow(blurRadius: 2)],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              constraints: const BoxConstraints.expand(height: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 4.0),
                        height: 40,
                        width: 180,
                        // color: Colors.yellowAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              // color: Colors.red,
                              height: 32,
                              width: 32,
                              child: Image.asset(
                                "assets/images/Bus.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              // color: Colors.blue,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.plate,
                                    style: const TextStyle(
                                        fontSize: H5,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Unidad : ${item.unitName}",
                                    style: const TextStyle(
                                      fontSize: P1,
                                      color: Color.fromARGB(255, 125, 125, 125),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        height: 40,
                        width: 180,
                        // color: Colors.redAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              // color: Colors.red,
                              height: 32,
                              width: 32,
                              child: Image.asset(
                                "assets/images/Calendar.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.date,
                                  style: const TextStyle(
                                      fontSize: H5,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 35,
                    margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              item.laps.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const Text(
                              'Vueltas',
                              style: TextStyle(
                                color: Color(0xFF9DA2AB),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            )
                          ],
                        ),
                        const VerticalDivider(
                          color: Color(0xFF9DA2AB),
                          thickness: 1,
                        ),
                        Column(
                          children: [
                            Text(
                              item.stops.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const Text(
                              'Paradas',
                              style: TextStyle(
                                color: Color(0xFF9DA2AB),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ]),
      );
    }
    itemsUnits.value = temp;
  }
}
