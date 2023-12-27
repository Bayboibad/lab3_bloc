import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab3/products/views/home/tabbar/bloc/tabbar_bloc.dart';
import 'package:lab3/products/views/home/tabbar/categoris_tab.dart';
import 'package:lab3/products/views/home/tabbar/home_tab.dart';
import 'package:lab3/products/views/home/tabbar/setting_tab.dart';

List<BottomNavigationBarItem> bottomItem = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
  BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), label: "Home"),
  BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Home"),
];
List<Widget> bottomNavScreen = <Widget>[
  const HomeTab(),
  const CategorisTab(),
  const SettingTab(),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabbarBloc, TabbarState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: bottomNavScreen.elementAt(state.tabIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(items: bottomItem,
          currentIndex: state.tabIndex,
          selectedItemColor:Colors.orange.shade700,
          unselectedItemColor: Colors.orange.shade600,
          onTap: (value) {
            BlocProvider.of<TabbarBloc>(context).add(TabChange(tabIndex: value));
          },),
        );
      },
    );
  }
}
