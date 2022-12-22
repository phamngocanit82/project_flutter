import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import '/constants.dart';

class LiteRollingSwitchPage extends StatefulWidget {
  const LiteRollingSwitchPage({Key? key}) : super(key: key);
  @override
  State<LiteRollingSwitchPage> createState() => _LiteRollingSwitchState();
}

class _LiteRollingSwitchState extends State<LiteRollingSwitchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: colorTextInput),
              onPressed: () => Navigator.of(context).pop(),
            ),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //By default
            LiteRollingSwitch(
              value: false,
              onChanged: (bool state) {
                debugPrint('turned ${(state) ? 'on' : 'off'}');
              },
              onDoubleTap: () {},
              onSwipe: () {},
              onTap: () {},
            ),

            //Customized
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: LiteRollingSwitch(
                value: true,
                width: 150,
                textOn: 'active',
                textOff: 'inactive',
                colorOn: Colors.deepOrange,
                colorOff: Colors.blueGrey,
                iconOn: Icons.lightbulb_outline,
                iconOff: Icons.power_settings_new,
                animationDuration: const Duration(milliseconds: 300),
                onChanged: (bool state) {
                  debugPrint('turned ${(state) ? 'on' : 'off'}');
                },
                onDoubleTap: () {},
                onSwipe: () {},
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
