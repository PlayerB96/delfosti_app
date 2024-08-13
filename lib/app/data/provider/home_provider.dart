// ignore_for_file: unused_import

import 'dart:convert';

import 'package:get/get_connect.dart';

const baseUrl = 'API_PATH';

class HomeProvider extends GetConnect {
  Future<Response> getUnits({required String token}) async {
    maxAuthRetries = 1;
    timeout = const Duration(seconds: 10);
    userAgent = 'getx-client';

    // Map<String, String> headers = {"Content-Type": "application/json"};
    Map<String, String> headers = {"Authorization": "Bearer $token"};
    // Map<String, dynamic> body = {
    //   "message": "Bearer",
    //   "status": true,
    //   "data": [
    //     {
    //       "plate": "PUK0822",
    //       "unitName": "1",
    //       "date": "01-09-2023",
    //       "laps": 2,
    //       "stops": 11
    //     },
    //     {
    //       "plate": "FAK0912",
    //       "unitName": "2",
    //       "date": "01-09-2023",
    //       "laps": 1,
    //       "stops": 12
    //     }
    //   ]
    // };
    // return body;
    final raw = await get("$baseUrl/api/v1/units", headers: headers);

    if (raw.statusCode == 200) {
      return raw;
    } else if (raw.statusCode == 400) {
      final parsed = raw.body;

      throw parsed["message"];
    } else {
      throw "Problema de conexión con el origen de datos";
    }
  }
}
