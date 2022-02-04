import 'package:flutter/material.dart';
import 'package:nuvigator_experts_club/features/register/pages/register_email_page.dart';

import 'model/register.dart';
import 'pages/register_age_page.dart';
import 'pages/register_name_page.dart';
import 'pages/register_pass_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

enum RegisterPageState { name, email, age, pass }

class RegisterNavigator extends StatefulWidget {
  RegisterNavigator({Key? key}) : super(key: key);

  @override
  _RegisterNavigatorState createState() => _RegisterNavigatorState();
}

class _RegisterNavigatorState extends State<RegisterNavigator> {
  @override
  void initState() {
    super.initState();
    _nextRoute();
  }

  _nextRoute() {
    setState(() {
      switch (_pageState) {
        case RegisterPageState.name:
          _pageState = RegisterPageState.email;
          _pages.add(RegisterEmailPage.page(
              email: _register.email,
              changeEmail: (email) {
                _register = _register.copyWith(email: email);
              },
              onContinue: () => _nextRoute()));
          break;
        case RegisterPageState.email:
          _pageState = RegisterPageState.age;
          _pages.add(RegisterAgePage.page(
              age: _register.email,
              changeAge: (age) {
                _register = _register.copyWith(age: age);
              },
              onContinue: () => _nextRoute()));
          break;
        case RegisterPageState.age:
          _pageState = RegisterPageState.pass;
          _pages.add(RegisterPassPage.page(
              pass: _register.password,
              changePass: (pass) {
                _register = _register.copyWith(password: pass);
              },
              registerData: _register.toString(),
              onContinue: () => _nextRoute()));
          break;
        default:
          _pageState = RegisterPageState.name;
          _pages.add(RegisterNamePage.page(
              name: _register.email,
              changeName: (name) {
                _register = _register.copyWith(name: name);
              },
              onContinue: () => _nextRoute()));
      }
    });
  }

  _previousRoute() {
    setState(() {
      if (_pages.length > 1) {
        _pages.removeLast();
        switch (_pageState) {
          case RegisterPageState.pass:
            _pageState = RegisterPageState.age;
            break;
          case RegisterPageState.age:
            _pageState = RegisterPageState.email;
            break;
          case RegisterPageState.email:
            _pageState = RegisterPageState.name;
            break;
          default:
            _pageState = RegisterPageState.name;
        }
      }
    });
  }

  late List<Page> _pages = [];

  Register _register = Register.empty();

  RegisterPageState? _pageState;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: []..addAll(_pages),
      onPopPage: (router, result) {
        _previousRoute();
        return router.didPop(result);
      },
    );
  }
}
