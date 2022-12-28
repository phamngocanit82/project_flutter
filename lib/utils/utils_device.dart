import 'package:flutter/material.dart';

class UtilsDevice {
  static final UtilsDevice _singleton = UtilsDevice._internal();
  factory UtilsDevice() => _singleton;
  UtilsDevice._internal();
  static UtilsDevice get shared => _singleton;
  late double width;
  late double height;
  late double ratio;
  late double topBarHeight;
  late double bottomBarHeight;
  void setDeviceSize(BuildContext context) {
    UtilsDevice.shared.width = MediaQuery.of(context).size.width;
    UtilsDevice.shared.height = MediaQuery.of(context).size.height;
    UtilsDevice.shared.ratio = MediaQuery.of(context).size.width / 320;
    UtilsDevice.shared.topBarHeight = MediaQuery.of(context).padding.top == 0
        ? 50
        : MediaQuery.of(context).padding.top;
    UtilsDevice.shared.bottomBarHeight = MediaQuery.of(context).padding.bottom;
  }
}
