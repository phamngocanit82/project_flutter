import 'package:flutter/material.dart';

class CardFrontWidget extends StatelessWidget {
  const CardFrontWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 8,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Image.asset('assets/card1.png'),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              '123 456 789 123',
              style: TextStyle(
                  fontSize: 28,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w500,
                  shadows: [
                    Shadow(color: Colors.black12, offset: Offset(2, 1))
                  ]),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text('Card Holder'),
                    Text('Pham Ngoc An')
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text('Expiry'),
                    Text('27/10'),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
