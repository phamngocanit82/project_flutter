import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '/constants.dart';

class QRFlutterPage extends StatefulWidget {
  const QRFlutterPage({Key? key}) : super(key: key);
  @override
  State<QRFlutterPage> createState() => _QRFlutterState();
}

class _QRFlutterState extends State<QRFlutterPage> {
  @override
  Widget build(BuildContext context) {
    const message =
        // ignore: lines_longer_than_80_chars
        'Hey this is a QR code. Change this value in the main_screen.dart file.';

    final qrFutureBuilder = FutureBuilder<ui.Image>(
      future: _loadOverlayImage(),
      builder: (ctx, snapshot) {
        const size = 280.0;
        if (!snapshot.hasData) {
          return const SizedBox(width: size, height: size);
        }
        return CustomPaint(
          size: const Size.square(size),
          painter: QrPainter(
            data: message,
            version: QrVersions.auto,
            eyeStyle: const QrEyeStyle(
              eyeShape: QrEyeShape.square,
              color: Color(0xff128760),
            ),
            dataModuleStyle: const QrDataModuleStyle(
              dataModuleShape: QrDataModuleShape.circle,
              color: Color(0xff1a5441),
            ),
            // size: 320.0,
            embeddedImage: snapshot.data,
            embeddedImageStyle: QrEmbeddedImageStyle(
              size: const Size.square(60),
            ),
          ),
        );
      },
    );

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
        body: Material(
            color: Colors.white,
            child: SafeArea(
                top: true,
                bottom: true,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: SizedBox(
                          width: 280,
                          child: qrFutureBuilder,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 40)
                          .copyWith(bottom: 40),
                      child: const Text(message),
                    ),
                  ],
                ))));
  }

  Future<ui.Image> _loadOverlayImage() async {
    final completer = Completer<ui.Image>();
    final byteData = await rootBundle.load('assets/logo.jpg');
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }
}
