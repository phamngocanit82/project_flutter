import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorkSpaceWidget extends StatelessWidget {
  const WorkSpaceWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 300.0,
      height: 300.0,
      child: SpinKitFadingCircle(
        itemBuilder: (_, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? Colors.red : Colors.green,
            ),
          );
        },
        size: 120.0,
      ),
    );
  }
}
