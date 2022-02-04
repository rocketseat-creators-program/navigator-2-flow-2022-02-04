import 'package:flutter/material.dart';

class RegisterEmailPage extends StatelessWidget {

  static Page page(
      {required String email,
      required Function(String) changeEmail,
      required VoidCallback onContinue}) {
    return MaterialPage(
      maintainState: true,
      child: RegisterEmailPage(
        email: email,
        changeEmail: changeEmail,
        onContinue: onContinue,
      ),
    );
  }

  const RegisterEmailPage(
      {Key? key,
      required this.email,
      required this.changeEmail,
      required this.onContinue})
      : super(key: key);
  final String email;
  final Function(String) changeEmail;
  final VoidCallback onContinue;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('email'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: TextField(
            onChanged: changeEmail,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chevron_right),
        onPressed: onContinue,
      ),
    );
  }
}
