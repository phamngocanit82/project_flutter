import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/constants.dart';
import '/utils/utils_dialog.dart';
import '/utils/utils_language.dart';
import '/utils/utils_navigator.dart';
import '/utils/utils_platform.dart';
import '/utils/utils_style.dart';
import '/blocs/authentication_bloc.dart';
import 'register_page.dart';
import '/main.dart' as main;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthenticationBloc authenticationBloc = AuthenticationBloc();
  final TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  final TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    emailFocusNode.addListener(() {
      setState(() {});
    });
    passwordFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
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
  void dispose() {
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
                  UtilsLanguage.shared.language("login!", "login!"),
                  style: TextStyle(
                      fontSize: 20 * UtilsDevice.shared.ratio,
                      fontWeight: FontWeight.w600,
                      color: colorTextInput),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                  child: StreamBuilder(
                      stream: authenticationBloc.emailStream,
                      builder: (context, snapshot) => UtilsStyle.textFormField(
                          emailController,
                          emailFocusNode,
                          UtilsLanguage.shared.language("email", "email"),
                          requestEmailFocus,
                          Image.asset("assets/ic_mail.png"),
                          snapshot))),
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
              Container(
                constraints:
                    BoxConstraints.loose(const Size(double.infinity, 40)),
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    UtilsLanguage.shared
                        .language("forgot password ?", "forgot password ?"),
                    style: TextStyle(
                        fontSize: 13 * UtilsDevice.shared.ratio,
                        color: Colors.blue),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
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
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: RichText(
                  text: TextSpan(
                      text: UtilsLanguage.shared.language(
                          "don't have an account ?", "has account yet ?"),
                      style: TextStyle(
                          color: colorTextInput,
                          fontSize: 13 * UtilsDevice.shared.ratio),
                      children: <TextSpan>[
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                debugPrint(ModalRoute.of(UtilsNavigator
                                        .navigationKey.currentContext!)!
                                    .settings
                                    .name);
                                main.myAppStateKey.currentState!.printSample();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterPage()));
                              },
                            text: UtilsLanguage.shared
                                .language("register now!", "register now!"),
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

  void doneClick() {
    var isValid = authenticationBloc.isValidLogin(
        emailController.text, passwordController.text);
    if (isValid) {
      UtilsDialog.shared.showLoading(context);
      authenticationBloc.signIn(emailController.text, passwordController.text,
          () {
        UtilsDialog.shared.hideLoading();
        Navigator.of(context).pop();
      }, (msg) {
        UtilsDialog.shared.hideLoading();
      });
    }
  }
}
