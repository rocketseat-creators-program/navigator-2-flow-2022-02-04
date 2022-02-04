import 'package:flutter/material.dart';

class RegisterPassPage extends StatelessWidget {
  static Page page(
      {required String pass,
      required Function(String) changePass,
      required VoidCallback onContinue,
      required String registerData}) {
    return MaterialPage(
      child: RegisterPassPage(
        pass: pass,
        changePass: changePass,
        onContinue: onContinue,
        registerData: registerData,
      ),
    );
  }

  const RegisterPassPage(
      {Key? key,
      required this.pass,
      required this.changePass,
      required this.onContinue,
      required this.registerData})
      : super(key: key);
  final String pass;
  final Function(String) changePass;
  final VoidCallback onContinue;
  final String registerData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pass'),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                onChanged: changePass,
              ),
            ),
          ),
          Text(registerData),
        ],
      ),
    );
  }
}
