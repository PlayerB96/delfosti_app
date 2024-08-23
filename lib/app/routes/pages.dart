import 'package:delfosti_app/app/bindings/addmovies_binding.dart';
import 'package:delfosti_app/app/bindings/categories_binding.dart';
import 'package:delfosti_app/app/bindings/login_binding.dart';
import 'package:delfosti_app/app/ui/pages/addmovies/addmovies_page.dart';
import 'package:delfosti_app/app/ui/pages/categories/categories_page.dart';

import 'package:get/get.dart';
import 'package:delfosti_app/app/bindings/home_binding.dart';
import 'package:delfosti_app/app/ui/pages/login/login_page.dart';
import 'package:delfosti_app/app/ui/pages/home/home_page.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.noTransition,
      // middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
      // middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.CATEGORIES,
      page: () => CategoriesPage(),
      binding: CategoriesBinding(),
      transition: Transition.noTransition,
      // middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.ADDMOVIES,
      page: () => AddMoviesPage(),
      binding: AddMoviesBinding(),
      transition: Transition.noTransition,
      // middlewares: [AuthMiddleware()],
    ),
  ];
}
