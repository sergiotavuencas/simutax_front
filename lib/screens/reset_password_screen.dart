import 'package:flutter/material.dart';
import 'package:simutax_mobile/screens/login_screen.dart';
import 'package:simutax_mobile/theme/app_style.dart';
import 'package:simutax_mobile/theme/widgets/code_field.dart';
import 'package:simutax_mobile/theme/widgets/password_field.dart';
import 'package:simutax_mobile/theme/widgets/repassword_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ResetPasswordScreenViewState();
}

class _ResetPasswordScreenViewState extends State<ResetPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appStyle = AppStyle(context);

    final descriptionBox = SizedBox(
      child: Text(
          "Insira o código enviado ao e-mail cadastrado, e sua nova senha.",
          style: appStyle.descriptionStyle),
    );

    final codeField = CodeField(controller: codeController);
    final passwordField = PasswordField(controller: passwordController);
    final repasswordField = RepasswordField(
        passwordController: passwordController,
        repasswordController: repasswordController);

    final fields = SizedBox(
      width: appStyle.width / 1.1,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: descriptionBox,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: codeField,
          ),
          passwordField,
          repasswordField
        ],
      ),
    );

    final redefineButton = ElevatedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const LoginScreen(),
              ),
            );
          });
        }
      },
      style: appStyle.createButtonTheme(appStyle.darkBlue),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Continuar",
              style: appStyle.buttonStyleBlue,
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.arrow_forward_ios,
                color: Color.fromARGB(255, 95, 95, 95)),
          )
        ],
      ),
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Redefinir Senha'),
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: SizedBox(
              height: appStyle.height / 1.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: appStyle.height / 20),
                        child: fields,
                      ),
                      SizedBox(
                        width: appStyle.width / 1.1,
                        child: redefineButton,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
