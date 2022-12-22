import 'package:flutter/material.dart';
import 'showcase_widget.dart';
import 'workspace_widget.dart';
import '/constants.dart';

class SpinkitPage extends StatefulWidget {
  const SpinkitPage({Key? key}) : super(key: key);
  @override
  State<SpinkitPage> createState() => _SpinkitState();
}

class _SpinkitState extends State<SpinkitPage> {
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
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: LayoutBuilder(
                builder: (context, _) {
                  return IconButton(
                    icon: const Icon(Icons.play_circle_filled),
                    iconSize: 50.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const ShowCaseWidget(),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const Positioned.fill(
              child: Center(
                child: WorkSpaceWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
