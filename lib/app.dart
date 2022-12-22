import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import '/utils/utils_navigator.dart';
import '/view/home_page.dart';
import '/view/order_page.dart';
import '/view/map_page.dart';
import '/view/notification_page.dart';
import '/view/menu_page.dart';
//import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'constants.dart';
//import 'view/widget/menu_drawer.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;
    prefs.setInt("counter", counter);
    debugPrint("counter:$counter");
  }

  @override
  void initState() {
    incrementCounter();
    Firebase.initializeApp();
    super.initState();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const OrderPage(),
    const MapPage(),
    const NotificationPage(),
    const MenuPage(),
  ];
  //late FSBStatus drawerStatus = FSBStatus.FSB_CLOSE;
  static GlobalKey bottomNavigationBarKey = GlobalKey();
  final GlobalKey<MyAppState> keyMyAppState = GlobalKey<MyAppState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'project_flutter',
      color: kTaskColor,
      theme: ThemeData(
          primarySwatch: Colors.orange,
          canvasColor: Colors.white,
          textTheme: const TextTheme()),
      navigatorKey: UtilsNavigator.navigationKey,
      home: Scaffold(
        body: _widgetOptions[_selectedIndex],
        /*body: FoldableSidebarBuilder(
          drawerBackgroundColor: Colors.deepOrange,
          drawer: MenuDrawer(
            closeDrawer: () {
              setState(() {
                drawerStatus = FSBStatus.FSB_CLOSE;
              });
            },
          ),
          screenContents: IndexedStack(
            index: _selectedIndex,
            children: _widgetOptions,
          ),
          status: drawerStatus,
        ),*/
        bottomNavigationBar: BottomNavigationBar(
          key: bottomNavigationBarKey,
          type: BottomNavigationBarType.fixed,
          backgroundColor: kTaskColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: "Order",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: "Map",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notification",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black54,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void printSample() {
    _onItemTapped(3);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index != 14) {
        _selectedIndex = index;
      } else {
        //drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
        //    ? FSBStatus.FSB_CLOSE
        //    : FSBStatus.FSB_OPEN;
      }
    });
  }
}
