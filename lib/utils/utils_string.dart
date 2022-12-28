import 'package:intl/intl.dart';

abstract class UtilsString {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static final RegExp _mobileRegExp = RegExp(
    r'(^(?:[+0]9)?[0-9]{10,13}$)',
  );

  static final RegExp _nameRegExp = RegExp(
    r'^[A-za-z ]+$',
  );

  static bool isValidEmail(String email) => _emailRegExp.hasMatch(email);

  static bool isValidPassword(String password) =>
      _passwordRegExp.hasMatch(password);

  static bool isMobile(String moblie) => _mobileRegExp.hasMatch(moblie);

  static bool isName(String name) => _nameRegExp.hasMatch(name);

  String formatPriceNumber(int number, {String formatUnit: "vn"}) {
    final formatter = NumberFormat("###,###");
    return formatter.format(number) + (formatUnit == "vn" ? " VND" : " \$");
  }

  String formatPriceNumberNonUnit(int number) {
    final formatter = NumberFormat("###,###");
    return formatter.format(number);
  }
}
