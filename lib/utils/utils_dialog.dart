import 'package:flutter/material.dart';
import 'utils_platform.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UtilsDialog {
  static final UtilsDialog _singleton = UtilsDialog._internal();
  factory UtilsDialog() => _singleton;
  UtilsDialog._internal();
  static UtilsDialog get shared => _singleton;
  late BuildContext _context;
  void showLoading(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          _context = c;
          return Dialog(
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.black54.withOpacity(0.5),
              child: SizedBox.expand(
                child: SpinKitThreeBounce(
                  color: Colors.white,
                  size: 25 * UtilsDevice.shared.ratio,
                ),
              ));
        });
  }

  void hideLoading() {
    Navigator.of(_context).pop();
  }
}

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: const [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please Wait....",
                          style: TextStyle(color: Colors.blueAccent),
                        )
                      ]),
                    )
                  ]));
        });
  }
}

class MessageDialog {
  static void showMessage(BuildContext context, String title, String msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop(MessageDialog);
            },
          ),
        ],
      ),
    );
  }
}
