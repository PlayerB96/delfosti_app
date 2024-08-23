import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delfosti_app/app/controller/login_controller.dart';
import 'package:delfosti_app/app/ui/pages/login/widgets/textfield_pass.dart';
import 'package:delfosti_app/app/ui/pages/login/widgets/textfield_user.dart';
import 'package:delfosti_app/app/ui/utils/style_utils.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: BACKGROUND,
      constraints: const BoxConstraints.expand(),
      child: SingleChildScrollView(
        child: GetBuilder<LoginController>(
          builder: (loginCntl) {
            return Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 340,
                      width: 350,
                      child: Image.asset(
                        "assets/images/Image1.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Text(
                      'DELFOSTI',
                      style: TextStyle(
                          fontSize: H2,
                          fontWeight: FontWeight.w400,
                          color: PRIMARY),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                textfielUsuario(cntl: loginCntl.userCtll),
                const SizedBox(height: 16),
                textfielPass(
                    cntl: loginCntl.passCtll, obs: loginCntl.obscurePass),
                const SizedBox(height: 50),
                Container(
                  constraints: const BoxConstraints.expand(height: 50.0),
                  decoration: BoxDecoration(
                    color: PRIMARY,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      await loginCntl.getCred();
                    },
                    child: const Text(
                      "INGRESAR",
                      style: TextStyle(fontSize: P1, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Todos los derechos reservados @delfostis 2024',
                  style: TextStyle(fontSize: P2, color: UNNOTICED),
                )
              ],
            );
          },
        ),
      ),
    )));
  }
}
