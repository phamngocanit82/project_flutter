import 'package:flutter/material.dart';
import 'app.dart';
import 'splash_page.dart';

GlobalKey<MyAppState> myAppStateKey = GlobalKey();
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const SplashPage(),
    routes: <String, WidgetBuilder>{
      '/MyApp': (BuildContext context) => MyApp(key: myAppStateKey)
    },
  ));
}
