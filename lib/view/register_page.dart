import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/blocs/authentication_bloc.dart';
import '/utils/utils_style.dart';
import '/utils/utils_dialog.dart';
import '/utils/utils_language.dart';
import '/utils/utils_platform.dart';
import '../constants.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthenticationBloc authenticationBloc = AuthenticationBloc();

  TextEditingController nameController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();

  TextEditingController phoneController = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();

  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  void requestNameFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(nameFocusNode);
    });
  }

  void requestPhoneFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(phoneFocusNode);
    });
  }

  void requestEmailFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(emailFocusNode);
    });
  }

  void requestPasswordFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(passwordFocusNode);
    });
  }

  @override
  void initState() {
    nameFocusNode.addListener(() {
      setState(() {});
    });
    phoneFocusNode.addListener(() {
      setState(() {});
    });
    emailFocusNode.addListener(() {
      setState(() {});
    });
    passwordFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    nameFocusNode.dispose();
    phoneFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    authenticationBloc.dispose();
    super.dispose();
  }

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
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  UtilsLanguage.shared.language("register!", "register!"),
                  style: TextStyle(
                      fontSize: 20 * UtilsDevice.shared.ratio,
                      fontWeight: FontWeight.w600,
                      color: colorTextInput),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                child: StreamBuilder(
                    stream: authenticationBloc.nameStream,
                    builder: (context, snapshot) => UtilsStyle.textFormField(
                        nameController,
                        nameFocusNode,
                        UtilsLanguage.shared.language("surname", "surname"),
                        requestNameFocus,
                        Image.asset("assets/ic_user.png"),
                        snapshot)),
              ),
              StreamBuilder(
                  stream: authenticationBloc.phoneStream,
                  builder: (context, snapshot) => UtilsStyle.textFormField(
                      phoneController,
                      phoneFocusNode,
                      UtilsLanguage.shared.language("phone", "phone"),
                      requestPhoneFocus,
                      Image.asset("assets/ic_phone.png"),
                      snapshot)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: StreamBuilder(
                    stream: authenticationBloc.emailStream,
                    builder: (context, snapshot) => UtilsStyle.textFormField(
                        emailController,
                        emailFocusNode,
                        UtilsLanguage.shared.language("email", "email"),
                        requestEmailFocus,
                        Image.asset("assets/ic_mail.png"),
                        snapshot)),
              ),
              StreamBuilder(
                  stream: authenticationBloc.passStream,
                  builder: (context, snapshot) => UtilsStyle.textFormField(
                      passwordController,
                      passwordFocusNode,
                      UtilsLanguage.shared.language("password", "password"),
                      requestPasswordFocus,
                      Image.asset("assets/ic_phone.png"),
                      snapshot,
                      obscureText: true)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      doneClick();
                    },
                    child: Text(
                      UtilsLanguage.shared.language("done", "done"),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13 * UtilsDevice.shared.ratio),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: RichText(
                  text: TextSpan(
                      text: UtilsLanguage.shared
                          .language("already registered", "already registered"),
                      style: TextStyle(
                          color: colorTextInput,
                          fontSize: 13 * UtilsDevice.shared.ratio),
                      children: <TextSpan>[
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              },
                            text:
                                UtilsLanguage.shared.language("login", "login"),
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13 * UtilsDevice.shared.ratio))
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  doneClick() {
    var isValid = authenticationBloc.isValidRegister(nameController.text,
        emailController.text, passwordController.text, phoneController.text);
    if (isValid) {
      UtilsDialog.shared.showLoading(context);
      authenticationBloc.signUp(emailController.text, passwordController.text,
          phoneController.text, nameController.text, () {
        UtilsDialog.shared.hideLoading();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      }, (msg) {
        UtilsDialog.shared.hideLoading();
        MessageDialog.showMessage(context, "Sign-In", msg);
        // show msg dialog
      });
    }
  }
}
