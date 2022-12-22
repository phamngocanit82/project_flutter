import 'dart:async';
import 'package:flutter/material.dart';
import 'utils/utils_language.dart';
import 'utils/utils_platform.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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
