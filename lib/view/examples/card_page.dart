import 'dart:math';
import 'package:flutter/material.dart';
import 'card_back_widget.dart';
import 'card_front_widget.dart';
import '/constants.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);
  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  double _rotationFactor = 0;
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
            children: <Widget>[
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(pi * _rotationFactor),
                origin: Offset(MediaQuery.of(context).size.width / 2, 0),
                child: _rotationFactor < 0.5
                    ? const CardFrontWidget()
                    : const CardBackWidget(),
              ),
              SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.red,
                    inactiveTrackColor: Colors.black,
                    trackHeight: 3.0,
                    thumbColor: Colors.green,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                    overlayColor: Colors.purple.withAlpha(32),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 14.0),
                  ),
                  child: Slider(
                    onChanged: (double value) {
                      setState(() {
                        _rotationFactor = value;
                      });
                    },
                    value: _rotationFactor,
                  )),
            ],
          ),
        ));
  }
}
