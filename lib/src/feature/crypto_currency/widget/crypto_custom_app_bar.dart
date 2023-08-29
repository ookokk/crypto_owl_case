import 'package:flutter/material.dart';

AppBar cryptoCustomAppBar(String text) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.8,
    title: Center(
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ),
  );
}
