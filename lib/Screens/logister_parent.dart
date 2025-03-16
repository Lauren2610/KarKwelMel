import 'package:flutter/material.dart';
import 'package:karkwelmel_fullstack_flutter/Screens/Loginpage.dart';
import 'package:karkwelmel_fullstack_flutter/Screens/RegisterPage.dart';

class LogisterParent extends StatefulWidget {
  const LogisterParent({Key? key}) : super(key: key);

  @override
  State<LogisterParent> createState() => _LogisterParentState();
}

class _LogisterParentState extends State<LogisterParent> {
  bool _isLoginPage = true;

  void _togglePage() {
    setState(() {
      _isLoginPage = !_isLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoginPage)
      return LoginScreen(togglePage: _togglePage);
    else
      return RegisterScreen(togglePage: _togglePage);
  }
}
