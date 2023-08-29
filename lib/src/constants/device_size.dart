import 'package:flutter/material.dart';

class DeviceSize {
  static double dWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double dHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
