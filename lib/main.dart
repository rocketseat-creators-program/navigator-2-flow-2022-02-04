import 'package:flutter/material.dart';

import 'features/register/pages/register_name_page.dart';
import 'features/register/register_navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterNavigator()
    );
  }
}
