import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  final Function? closeDrawer;
  const MenuDrawer({Key? key, this.closeDrawer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.70,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.withAlpha(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/rps_logo.png",
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Pham Ngoc An")
                ],
              )),
          ListTile(
            onTap: () {
              debugPrint("Tapped Profile");
            },
            leading: const Icon(Icons.person),
            title: const Text(
              "Your Profile",
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped settings");
            },
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Payments");
            },
            leading: const Icon(Icons.payment),
            title: const Text("Payments"),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Notifications");
            },
            leading: const Icon(Icons.notifications),
            title: const Text("Notifications"),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Log Out");
            },
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Log Out"),
          ),
        ],
      ),
    );
  }
}
