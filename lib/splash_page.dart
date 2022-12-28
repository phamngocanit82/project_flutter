import 'dart:async';
import 'package:flutter/material.dart';
import 'base_widget.dart';
import 'utils/utils_language.dart';
import 'utils/utils_device.dart';

class SplashPage extends BaseWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BaseState<SplashPage> {
  startTime() async {
    return Timer(const Duration(seconds: 2), navigationPage);
  }

  void navigationPage() {
    UtilsLanguage.shared
        .readFileJson("assets/language.json")
        .then((value) => Navigator.of(context).pushReplacementNamed('/MyApp'));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    UtilsDevice.shared.setDeviceSize(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/logo.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
