import 'package:flutter/material.dart';
import 'package:lab3/products/views/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String username = "";
  String password = "";
  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final prefs = await _prefs;
    setState(() {
      username = prefs.getString("username") ?? '';
      password = prefs.getString("password") ?? '';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cài đặt"),
        automaticallyImplyLeading: false,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: [
            Container(
              height: 150,
              margin: const EdgeInsets.only(top: 40),
              alignment: Alignment.center,
              child: const Icon(
                Icons.account_circle,
                size: 150,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin:
                  const EdgeInsets.only(left: 24, right: 8, top: 8, bottom: 4),
              child: Text(
                // ignore: unnecessary_brace_in_string_interps
                "Tên tài khoản: ${username}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin:
                  const EdgeInsets.only(left: 24, right: 8, top: 4, bottom: 8),
              child: Text(
                // ignore: unnecessary_brace_in_string_interps
                "Mật Khẩu: ${password}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height * .5,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width * 1, 50),
                    backgroundColor: Colors.orange[400]),
                child: const Text("Đăng xuất",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  const LoginPage()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
