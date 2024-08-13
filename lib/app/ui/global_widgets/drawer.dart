import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:puntossmart_usuarios/app/routes/pages.dart';
import 'package:puntossmart_usuarios/app/ui/utils/style_utils.dart';

Drawer drawer({required String nameConductor, required String phoneConductor}) {
  // Definir el array con los datos de cada elemento del Drawer
  final List<Map<String, dynamic>> drawerItems = [
    {
      'title': 'Mi Perfil',
      'icon': Image.asset('assets/images/Profile.png', fit: BoxFit.fill),
      'onTap': () {
        print("Perfil seleccionado");
      }
    },
    {
      'title': 'Mi Cartera',
      'icon': Image.asset('assets/images/Wallet.png', fit: BoxFit.fill),
      'onTap': () async {
        print("wallet seleccionado");
      }
    },
    {
      'title': 'Mi Código QR',
      'icon': Image.asset('assets/images/FrameQR.png', fit: BoxFit.fill),
      'onTap': () {
        print("Perfil seleccionado");
      }
    },
    {
      'title': 'Enviar Puntos',
      'icon': Image.asset('assets/images/Message.png', fit: BoxFit.fill),
      'onTap': () async {
        print("wallet seleccionado");
      }
    },
    {
      'title': 'Historial',
      'icon': Image.asset('assets/images/Document.png', fit: BoxFit.fill),
      'onTap': () async {
        print("wallet seleccionado");
      }
    },
    {
      'title': 'Comprar Puntos',
      'icon': Image.asset('assets/images/Wallet.png', fit: BoxFit.fill),
      'onTap': () {
        print("Perfil seleccionado");
      }
    },
    {
      'title': 'Contáctanos',
      'icon': Image.asset('assets/images/Message2.png', fit: BoxFit.fill),
      'onTap': () async {
        print("wallet seleccionado");
      }
    },
    {
      'title': 'Configuraciones',
      'icon': Image.asset('assets/images/Setting.png', fit: BoxFit.fill),
      'onTap': () async {
        print("wallet seleccionado");
      }
    },
    {
      'title': 'Referidos ',
      'icon': Image.asset('assets/images/Earn.png', fit: BoxFit.fill),
      'onTap': () {
        print("Perfil seleccionado");
      }
    },
    {
      'title': 'Ayuda & FAQs',
      'icon': Image.asset('assets/images/Helps.png', fit: BoxFit.fill),
      'onTap': () async {
        print("wallet seleccionado");
      }
    },
    {
      'title': 'Salir',
      'icon': Image.asset('assets/images/logout.png', fit: BoxFit.fill),
      'onTap': () async {
        final box = GetStorage();
        await box.erase();
        Get.offAllNamed(Routes.LOGIN);
      }
    }
  ];

  return Drawer(
    backgroundColor: Colors.white,
    width: 260,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(15), // Redondea los bordes
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50), // Redondea la imagen
                  child: Image.asset(
                    pathPersonDrawer,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                nameConductor,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Text(
                phoneConductor,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF9EA1B1),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: drawerItems.map((item) {
              return InkWell(
                onTap: item['onTap'],
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      width: 20,
                      height: 20,
                      child: item['icon'],
                    ),
                    Text(
                      item['title'],
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    ),
  );
}
