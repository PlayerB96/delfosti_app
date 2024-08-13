import 'package:puntossmart_usuarios/app/bindings/login_binding.dart';

import 'package:get/get.dart';
import 'package:puntossmart_usuarios/app/bindings/home_binding.dart';
import 'package:puntossmart_usuarios/app/ui/pages/login/login_page.dart';
import 'package:puntossmart_usuarios/app/ui/pages/home/home_page.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      // middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      // middlewares: [AuthMiddleware()],
    ),
  ];
}
