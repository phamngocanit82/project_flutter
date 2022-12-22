import 'package:flutter/material.dart';

class UtilsDevice {
  static final UtilsDevice _singleton = UtilsDevice._internal();
  factory UtilsDevice() => _singleton;
  UtilsDevice._internal();
  static UtilsDevice get shared => _singleton;
  late double width;
  late double height;
  late double ratio;
  void setDeviceSize(BuildContext context) {
    UtilsDevice.shared.width = MediaQuery.of(context).size.width;
    UtilsDevice.shared.height = MediaQuery.of(context).size.height;
    UtilsDevice.shared.ratio = MediaQuery.of(context).size.width / 320;
  }
}
