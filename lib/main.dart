import 'package:delfosti_app/app/bindings/login_binding.dart';
import 'package:delfosti_app/app/routes/pages.dart';
import 'package:delfosti_app/app/ui/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LOGIN,
      initialBinding: LoginBinding(),
      theme: appThemeDataLight,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      builder: (context, myWidget) {
        myWidget = EasyLoading.init()(context, myWidget);
        return myWidget;
      },
    ),
  );
}
