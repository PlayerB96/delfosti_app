import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:puntossmart_usuarios/app/controller/menu_controller.dart';
import 'package:puntossmart_usuarios/app/data/repository/login_repository.dart';
import 'package:puntossmart_usuarios/app/routes/pages.dart';

class LoginController extends GetxController {
  final LoginRepository loginRepository = LoginRepository();
  final MenuzController menuController = MenuzController();
  RxBool obscurePass = RxBool(true);

  TextEditingController userCtll = TextEditingController(text: "");
  TextEditingController passCtll = TextEditingController(text: "");

  Future<void> getCred() async {
    if (userCtll.text.isEmpty || passCtll.text.isEmpty) {
      EasyLoading.showInfo("Rellena todos los campos");
    } else {
      Get.offAllNamed(Routes.DASHBOARD);
      // try {
      //   // print("${usercntl.text} ${passcntl.text}");
      //   final cred =
      //       await loginRepository.getCred(userCtll.text, passCtll.text);

      //   final box = GetStorage();
      //   await box.write('isLogged', true);
      //   await box.write('user', userCtll.text);
      //   await box.write('code', cred.data.code);
      //   await box.write('business', cred.data.business);
      //   await box.write('token', cred.data.token);
      //   Get.offAllNamed(Routes.DASHBOARD);
      // } catch (err) {
      //   print("error");

      //   print(err);
      //   EasyLoading.showError(err.toString());
      // }
    }
  }
}
