import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab3/products/views/home/home.dart';
import 'package:lab3/products/views/home/tabbar/home_tab.dart';
import 'package:lab3/products/views/login/bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Đăng Nhập"),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                } else if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              // ignore: avoid_unnecessary_containers
              builder: (context, state) => Container(
                margin: const EdgeInsets.all(8),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: usernameController,
                            decoration:
                                const InputDecoration(labelText: 'Username'),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              maximumSize: Size(MediaQuery.of(context).size.width*1, 50)
                            ),
                            onPressed: () {
                              context.read<LoginBloc>().add(LoginButton(
                                  username: usernameController.text,
                                  password: passwordController.text));
                            },
                            child: const Text('Đăng nhập'),
                          ),
                        ],
                      ),
                    ),
                  )),
        ));
  }
}
