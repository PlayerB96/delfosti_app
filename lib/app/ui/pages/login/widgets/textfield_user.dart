import 'package:flutter/material.dart';

TextField textfielUsuario({required TextEditingController cntl}) {
  return TextField(
    controller: cntl,
    decoration: const InputDecoration(
      fillColor: Colors.white,
      hoverColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      label: Text('Usuario'),
      prefixIcon: Icon(Icons.person),
      isDense: true,
    ),
  );
}
