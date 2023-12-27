import 'package:flutter/material.dart';
import 'package:lab3/products/views/home/home.dart';
import 'package:lab3/products/views/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  bool isLoggedIn1 = false;

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn1 = prefs.getString("username") != null; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn1 ? const HomePage() :  const LoginPage();
  }
}
