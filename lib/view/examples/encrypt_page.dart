import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import '/constants.dart';

class EncryptPage extends StatefulWidget {
  const EncryptPage({super.key});

  @override
  State<EncryptPage> createState() => _EncryptState();
}

class _EncryptState extends State<EncryptPage> {
  @override
  Widget build(BuildContext context) {
    const plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
    final key = encrypt.Key.fromUtf8('my 32 length key................');
    final iv = encrypt.IV.fromLength(16);

    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    debugPrint(
        decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
    debugPrint(encrypted.base64); // R4

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
        body: const SizedBox());
  }
}
