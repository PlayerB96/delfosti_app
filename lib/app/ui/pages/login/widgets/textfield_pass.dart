import 'package:flutter/material.dart';
import 'package:get/get.dart';

Obx textfielPass({required TextEditingController cntl, required RxBool obs}) {
  return Obx(
    () => TextField(
      controller: cntl,
      obscureText: obs.value,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hoverColor: Colors.white,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        filled: true,
        label: const Text('Clave'),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () {
            obs.value = !obs.value;
          },
          icon: const Icon(Icons.remove_red_eye),
        ),
        isDense: true,
      ),
    ),
  );
}
