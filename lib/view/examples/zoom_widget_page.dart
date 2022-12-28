import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';
import '../../base_widget.dart';
import '/constants.dart';

class ZoomWidgetPage extends BaseWidget {
  const ZoomWidgetPage({Key? key}) : super(key: key);
  @override
  State<ZoomWidgetPage> createState() => _ZoomWidgetState();
}

class _ZoomWidgetState extends BaseState<ZoomWidgetPage> {
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
        body: Zoom(
            maxZoomWidth: 1800,
            maxZoomHeight: 1800,
            child: const Center(
              child: Text("Happy zoom!!"),
            )));
  }
}
