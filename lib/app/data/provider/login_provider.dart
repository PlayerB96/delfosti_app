// ignore_for_file: unused_import

import 'dart:convert';

import 'package:get/get_connect.dart';

const baseUrl = 'API_PATH';

class LoginProvider extends GetConnect {
  Future<Response> getCred(String us, String pa) async {
    Map<String, dynamic> body = {"user": us, "password": pa};

    final raw = await post("$baseUrl/api/v1/auth/login", body)
        .timeout(const Duration(milliseconds: 8000));
    print(raw.statusCode);
    if (raw.statusCode == 200) {
      return raw;
    } else if (raw.statusCode == 404) {
      final parsed = raw.body;
      throw parsed["message"];
    } else {
      throw "Problema de conexión con el origen de datos";
    }
  }
}
