import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab3/app.dart';
import 'package:lab3/products/services/api_products.dart';
import 'package:lab3/products/views/home/bloc/product_bloc.dart';
import 'package:lab3/products/views/home/tabbar/bloc/tabbar_bloc.dart';
import 'package:lab3/products/views/login/bloc/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) =>
              LoginBloc(sharedPreferences: SharedPreferences.getInstance()),
        ),
        BlocProvider<ProductCubit>(
          create: (BuildContext context) => ProductCubit(ApiProduct()),
        ),
        BlocProvider<TabbarBloc>(
          create: (BuildContext context) => TabbarBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AppPage(),
      ),
    );
  }
}
